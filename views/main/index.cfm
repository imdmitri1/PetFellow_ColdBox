
<cfquery name = "allPosts">
    SELECT p.id, p.pictureLink, p.description, p.author_id, u.username, c.content as comment, pl.totalLikes, pl2.liked, fl.favorited
    FROM Posts p
    INNER JOIN Users u ON p.author_id = u.id
    LEFT OUTER JOIN (
      SELECT c.post_id, c.content FROM Comments c GROUP BY c.post_id
    ) c ON c.post_id = p.id
    LEFT OUTER JOIN (
        SELECT SUM(pl.value) as totalLikes, pl.post_id FROM PostLikes pl GROUP BY pl.post_id
    ) pl ON pl.post_id = p.id
    LEFT OUTER JOIN (
        SELECT pl2.value as liked, pl2.post_id FROM PostLikes pl2 WHERE pl2.author_id = 1 GROUP BY pl2.post_id --current_user_id
    ) pl2 ON pl2.post_id = p.id
    LEFT OUTER JOIN (
        SELECT fl.id as favorited, fl.post_id FROM FavoritePosts fl WHERE fl.user_id = 1 GROUP BY fl.post_id --current_user_id
    ) fl ON fl.post_id = p.id
    ORDER BY p.id
</cfquery>
<!--- <cfdump var='#allPosts#'> --->

<cfset var queryArray=[] >
<!--- for ( row in allPosts ){
	queryArray.append( row );
} --->
<cfloop from="1" to="#allPosts.recordcount#" index="rowNumber">
	 <cfset queryArray.append( QueryGetRow( allPosts, rowNumber ) )>
</cfloop>

<!--- ******************************************************************** --->

<cfoutput>
  <div class="main-cont">

    <div class="d-flex justify-content-center m-2">
      <div class=""><a href="/" class="btn btn-outline-info btn-sm m-1">recently added</a></div>
      <div class=""><a href="/?50mostliked" class="btn btn-outline-info btn-sm m-1">50 most liked</a></div>
      <div class=""><a href="/?myfeed" class="btn btn-outline-info btn-sm m-1">my feed</a></div>
    </div>

    <div class="row">
        <cfloop array = "#queryArray#" item="post">
        <div class="col-sm-6 col-md-4 col-lg-3">

          <div class="card border-info mb-3">

              <div class="image-modal">
                  <img src="https:\\#post.pictureLink#" alt="#post.pictureLink#" class="img-fluid myImg mx-auto d-block img-main">
                <div class="moda myModa">
                  <span class="close">&times;</span>
                  <img src="" class="moda-content img01" >
                  <div class="caption"></div>
                </div>
              </div>

              <div class="row">

                <div class="col d-flex justify-content-center px-0 ">
                  <cfif post.favorited NEQ "">
                    <form action="/favorite" method="Post">
                      <input type="hidden" name="post_id" value="#post.id#">
                      <button type="submit" class="btn btn-outline-success fs"><i class="fa fa-star" aria-hidden="true"></i></i></button>
                    </form>
                  <cfelse>
                    <form action="/favorite" method="Post">
                      <input type="hidden" name="post_id" value="#post.id#">
                      <button type="submit" class="btn btn-outline-success fso"><i class="fa fa-star-o" aria-hidden="true"></i></button>
                    </form>
                  </cfif>
                </div>

                <div class="col d-flex justify-content-center  px-0">
                    <span class="like-count d-flex align-items-center mx-auto">#post.totalLikes#</span>
                </div>

                <div class="col d-flex justify-content-center  px-0 ">
                  <cfif post.liked EQ 1>
                    <form action="/like/Post/#post.id#" method="post">
                      <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                    </form>
                  <cfelse>
                    <form action="/like/Post/#post.id#" method="post">
                      <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                    </form>
                  </cfif>
                </div>

              </div>

              <div class="info">
                <span class="name">
                  <a href="/users/#post.author_id#">
                    #post.username#:
                  </a>
                </span>

                <span class="description">
                  <a href="/posts/#post.id#">
                    <cfif len(post.description) GT 50>
                        #left(post.description,50)#...
                    <cfelse>
                        #post.description#
                    </cfif>
                  </a>
                </span>

                <div class="float-right comments">
                  <cfif post.comment NEQ "">
                    <a href="/posts/#post.id#">
                      <span><i class="fa fa-comments" aria-hidden="true"></i></span>
                    </a>
                  <cfelse>
                      <a href="/posts/#post.id#">
                        <span><i class="fa fa-comments-o" aria-hidden="true"></i></span>
                      </a>
                  </cfif>
                </div>

              </div>

          </div>

        </div>
      </cfloop>
    </div>

    <nav aria-label="Search results pages">
      <div class="pagination justify-content-center font-weight-normal">
        <!--- <%= will_paginate @posts %> --->
      </div>
    </nav>

  </div>

  <footer class="footer border rounded">
    <div class="container ">
      <div class="row">
        <div class="col-12 d-flex justify-content-center">
          <div>
            <span><a href="https://github.com/imdmitri1/PetFellow" target="_blank"><i class="fa fa-github" aria-hidden="true"></i></a></span>
            <span>2018</span>
            <span><a href="http://www.dmitri.website" target="_blank"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a></span>
          </div>
        </div>
      </div>
    </div>
  </footer>
</cfoutput>
