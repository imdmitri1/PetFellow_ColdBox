
<!--- favored,liked,user,comments --->
<!--- SELECT p.id, p.pictureLink, p.description, p.author_id, u.username, c.content as comment, pl.totalLikes, pl2.liked, fl.favorited
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
ORDER BY p.id --->
<cfquery name = "post">
    SELECT p.*, u.username
    FROM Posts p
    INNER JOIN Users u ON p.author_id = u.id

    WHERE p.id = 1

</cfquery>
<cfdump var='#Post#'>

<cfset var queryArray=[] >
<!--- for ( row in Post ){
	queryArray.append( row );
} --->
<!--- <cfloop from="1" to="#Post.recordcount#" index="rowNumber">
	 <cfset queryArray.append( QueryGetRow( Post, rowNumber ) )>
</cfloop> --->

<!--- ******************************************************************** --->

<!--- <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %> --->
<cfoutput>
<div class="row">
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div class="col-sm-12 col-md-8 col-lg-8">

    <div class="card border-info mb-3">

        <cfif post.pictureLink.len() >
          <!--- <img src="http:\\#post.pictureLink#" alt="#post.pictureLink#" class="img-fluid"> --->
        <!--- <% else %> --->
          <!--- <img src="<%=@post.image_url%> " alt="<%=@post.image_url%>" class="img-fluid"> --->
        </cfif>

        <div class="row">

          <div class="col d-flex justify-content-center">
            <!--- <% if favorited?(@post) %> --->
            <form action="/favorite" method="Post">
              <input type="hidden" name="post_id" value="<%=@post.id%>">
              <button type="submit" class="btn btn-outline-success fs"><i class="fa fa-star" aria-hidden="true"></i></i></button>
            </form>
            <!--- <% else %> --->
            <form action="/favorite" method="Post">
              <input type="hidden" name="post_id" value="<%=@post.id%>">
              <button type="submit" class="btn btn-outline-success fso"><i class="fa fa-star-o" aria-hidden="true"></i></button>
            </form>
            <!--- <% end %> --->
          </div>

          <div class="col d-flex justify-content-center">
                <!--- <span class="like-count d-flex align-items-center mx-auto"><%= @post.likes.total_count %></span> --->
          </div>

          <div class="col d-flex justify-content-center">
            <!--- <% if liked?(@post) %> --->
              <form action="/like/Post/<%=@post.id%>" method="post">
                <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
              </form>
            <!--- <% else %> --->
              <form action="/like/Post/<%=@post.id%>" method="post">
                <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
              </form>
            <!--- <% end %> --->
          </div>

        </div>

        <div class="info">
          <span class="name">
            <a href="/users/<%=@post.author.id%>">
              <!--- #post.user_id#: --->
            </a>
          </span>

          <span class="description">
                #post.description#
          </span>

        </div>

        <div class="row info">
          <div class="date align-items-center float-right font-weight-light">
             posted on #post.created_at#
          </div>
        </div>

        <div>
          <!--- <% if author?(@post.author_id)%> --->
            <a href="/posts/<%=@post.id%>/edit" class="btn btn-link btn-sm">edit</a>
          <!--- <% end %> --->
          <!--- <% if author?(@post.author_id) || admin? %> --->
            <form action="/posts/<%=@post.id%>" method="Post">
              <input type="hidden" name="_method" value="delete">
              <input type="submit" value="delete post" class="btn btn-danger btn-sm btn-block">
            </form>
          <!--- <% end %> --->
        </div>

    </div>

  </div>
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
</div>

<div class="row">
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div class="col-sm-12 col-md-8 col-lg-8">
    <!--- <% if @post.comments.any? %> --->
      <h3 class="text-center">Comments:</h3>
        <ul class="list-group">
          <!--- <% @post.comments.order("created_at").each do |comment| %> --->
          <li class="list-group-item">
            <div class="row">

                <div class="col-12">
                  <span class="name">
                    <a href="/users/<%=comment.author_id%>">
                      <!--- <%=comment.author.username%>: --->
                    </a>
                  </span>

                  <span class="description">
                        <!--- <%=comment.content%> --->
                  </span>
                </div>

                <div class="col-12 alike">

                  <div class="d-inline-block">
                      <!--- <span class="like-count"><%= comment.likes.total_count %></span> --->
                  </div>

                  <div class="d-inline-block">
                    <!--- <% if liked?(comment) %> --->
                      <form action="/like/Comment/<%=comment.id%>" method="post">
                        <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                      </form>
                    <!--- <% else %> --->
                      <form action="/like/Comment/<%=comment.id%>" method="post">
                        <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                      </form>
                    <!--- <% end %> --->
                  </div>


                    <!--- <% if author?(comment.author_id)%> --->
                      <a href="/posts/<%=@post.id%>/comments/<%=comment.id%>/edit" class="btn btn-link btn-sm">edit</a>
                    <!--- <% end %> --->
                    <!--- <% if author?(comment.author_id) || admin? %> --->
                      <div class="d-inline-block">
                        <form action="/posts/<%=comment.post_id%>/comments/<%=comment.id%>" method="Post">
                          <input type="hidden" name="_method" value="delete">
                          <input type="submit" value="delete" class="btn btn-link btn-sm">
                        </form>
                      </div>
                    <!--- <% end %> --->

                      <!--- <div class="col-12 date font-weight-light">posted on <%=Date.strptime("#{comment.created_at}")%> --->
                      </div>
                </div>

            </div>

          </li>
        <!--- <% end %> --->
      </ul>
    <!--- <% else %> --->
      <h3>No comments yet</h3>
    <!--- <% end %> --->
    <a href="/posts/<%=@post.id%>/comments/new" class="btn btn-info d-block">add a comment</a>
  </div>
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
<div>
</cfoutput>
