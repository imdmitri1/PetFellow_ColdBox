
<cfquery name = "b">
    SELECT DISTINCT p.id, p.pic_link, p.description, p.author_id, u.username, c.content as comment
    FROM Posts p
    INNER JOIN Users u ON p.author_id = u.id
    LEFT OUTER JOIN (
      SELECT c.post_id, c.content FROM Comments c GROUP BY c.post_id
    ) c ON c.post_id = p.id
    ORDER BY p.id
</cfquery>
<cfdump var='#b#'>

  <!--- favorite
  likes --->

<cfoutput>
  <div class="main-cont">

    <div class="d-flex justify-content-center m-2">
      <div class=""><a href="/" class="btn btn-outline-info btn-sm m-1">recently added</a></div>
      <div class=""><a href="/?50mostliked" class="btn btn-outline-info btn-sm m-1">50 most liked</a></div>
      <div class=""><a href="/?myfeed" class="btn btn-outline-info btn-sm m-1">my feed</a></div>
    </div>

    <div class="row">
      <!--- <% @posts.each do |post| %> --->
        <cfloop query = "b">
          #b.pic_link#
        </cfloop>
        <div class="col-sm-6 col-md-4 col-lg-3">

          <div class="card border-info mb-3">

              <div class="image-modal">
                <!--- <% if post.pic_link %> --->
                  <!--- <img src="<%=post.pic_link%> " alt="<%=post.pic_link%>" class="img-fluid myImg mx-auto d-block img-main"> --->
                <!--- <% else %> --->
                  <!--- <img src="<%=post.image_url%> " alt="<%=post.image_url%>" class="img-fluid myImg mx-auto d-block img-main"> --->
                <!--- <% end %> --->
                <div class="moda myModa">
                  <span class="close">&times;</span>
                  <img src="" class="moda-content img01" >
                  <div class="caption"></div>
                </div>
              </div>

              <div class="row">

                <div class="col d-flex justify-content-center  px-0 ">
                  <!--- <% if favorited?(post) %> --->
                    <form action="/favorite" method="Post">
                      <!--- <input type="hidden" name="post_id" value="<%=post.id%>"> --->
                      <button type="submit" class="btn btn-outline-success fs"><i class="fa fa-star" aria-hidden="true"></i></i></button>
                    </form>
                  <!--- <% else %> --->
                    <form action="/favorite" method="Post">
                      <!--- <input type="hidden" name="post_id" value="<%=post.id%>"> --->
                      <button type="submit" class="btn btn-outline-success fso"><i class="fa fa-star-o" aria-hidden="true"></i></button>
                    </form>
                  <!--- <% end %> --->
                </div>

                <div class="col d-flex justify-content-center  px-0">
                    <!--- <span class="like-count d-flex align-items-center mx-auto"><%= post.likes.total_count %></span> --->
                </div>

                <div class="col d-flex justify-content-center  px-0 ">
                  <!--- <% if liked?(post) %> --->
                    <!--- <form action="/like/Post/<%=post.id%>" method="post"> --->
                      <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                    </form>
                  <!--- <% else %> --->
                    <!--- <form action="/like/Post/<%=post.id%>" method="post"> --->
                      <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                    </form>
                  <!--- <% end %> --->
                </div>

              </div>

              <div class="info">
                <span class="name">
                  <!--- <a href="/users/<%=post.author.id%>"> --->
                    <!--- <%=post.author.username%>: --->
                  </a>
                </span>

                <span class="description">
                  <!--- <a href="/posts/<%=post.id%>"> --->
                      <!--- <% if post.description && post.description.length > 50 %> --->
                        <!--- <%=post.description[0..50]%>... --->
                      <!--- <% else %> --->
                        <!--- <%=post.description%> --->
                      <!--- <% end %> --->
                  </a>
                </span>

                <div class="float-right comments">
                  <!--- <% if post.comments.any? %> --->
                    <!--- <a href="/posts/<%=post.id%>"> --->
                      <span><i class="fa fa-comments" aria-hidden="true"></i></span>
                    </a>
                  <!--- <% else %> --->
                      <!--- <a href="/posts/<%=post.id%>"> --->
                        <span><i class="fa fa-comments-o" aria-hidden="true"></i></span>
                      </a>
                  <!--- <% end %> --->
                </div>

              </div>

          </div>

        </div>
      <!--- <% end %> --->
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
