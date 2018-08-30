<cfoutput>

  <div class="row">
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
    <div class="col-sm-12 col-md-8 col-lg-8">
        <h3 class="text-center">Comments:</h3>
          <ul class="list-group">
            <% @all_comments.order("created_at").each do |comment| %>
              <li class="list-group-item">

                <div class="">
                  <span class="name">
                    <a href="/users/<%=comment.author_id%>">
                      <%=comment.author.username%>:
                    </a>
                  </span>

                  <span class="description">
                    <a href="/posts/<%= comment.post_id %>"><%=comment.content%></a>
                  </span>
                </div>

                <div class="">

                  <div class="d-inline-block">
                    <span class="like-count"><%= comment.likes.total_count %></span>
                  </div>

                  <div class="d-inline-block">
                    <% if liked?(comment) %>
                    <form action="/like/Comment/<%=comment.id%>" method="post">
                      <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                    </form>
                    <% else %>
                    <form action="/like/Comment/<%=comment.id%>" method="post">
                      <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                    </form>
                    <% end %>
                  </div>

                  <% if author?(comment.author_id) || admin? %>
                    <div class="d-inline-block">
                      <form action="/posts/<%=comment.id%>/comments/<%=comment.id%>" method="Post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="delete" class="btn btn-link btn-sm">
                      </form>
                    </div>
                  <% end %>

                  <div class="date font-weight-light">posted on <%=Date.strptime("{comment.created_at}")%>
                  </div>
                </div>

              </li>
          <% end %>
        </ul>
    </div>
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>

</cfoutput>
