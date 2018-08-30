<cfoutput>

  <div>
    <% if admin? %>
      <form action="/users/<%=@user.id%>" method="Post">
        <input type="hidden" name="_method" value="delete">
        <input type="submit" value="delete account  <%= @user.id %>, username: <%= @user.username %>, email: <%= @user.email %>" class="btn btn-danger">
      </form>
    <% end %>
  </div>

  <div class="jumbotron jumbotron-fluid">
    <div class="container">
      <div class="row">

        <div class="col-sm-6 col-md-4">
          <% if @user.image_url %>
            <img src="<%=@user.image_url%> " alt="<%=@user.image_url%>" class="img-fluid img-thumbnail avatar mx-auto d-block">
          <% else %>
            <img src="<%=@user.avatar%> " alt="<%=@user.avatar%>" class="img-fluid img-thumbnail avatar mx-auto d-block">
          <% end %>
        </div>

        <div class="col-sm-6 col-md-4">
          <div class="">Name: <%= @user.name%> </div>
          <div class="">Username: <%= @user.username%> </div>
          <div class="">Bio: <%= @user.bio%> </div>
        </div>

        <div class="col-sm-6 col-md-4 mx-auto align-items-center">
          <div class="btn-group-vertical btn-group-sm  d-flex justify-content-center">
            <% if your_page? %>
              <div class="">
                <a href="/posts/new" class="btn btn-outline-dark btn-sm">new post</a>
              </div>
              <div class="">
                <a href="/messages" class="btn btn-outline-dark btn-sm">messages</a>
              </div>
              <div class="">
                <a href="/users/<%=@user.id%>/edit"class="btn btn-outline-dark btn-sm">edit profile</a>
              </div>
            <% end %>

            <div class="">
              <a href="/users/<%=@user.id%>/followers" class="btn btn-outline-dark btn-sm">followers</a>
            </div>
            <div class="">
              <a href="/users/<%=@user.id%>/followings" class="btn btn-outline-dark btn-sm">following</a>
            </div>

            <% if !(your_page?) %>
                <div class="">
                  <a href="/messages/<%= @user.id %>" class="btn btn-outline-dark btn-sm">message</a>
                </div>

                <% if following? %>
                  <form action="/users/<%=@user.id%>/unfollow" method="Post">
                    <input type="hidden" name="_method" value="delete">
                    <input type="submit" value="unfollow" class="btn btn-outline-dark btn-sm">
                  </form>
                <% else %>
                  <form action="/users/<%=@user.id%>/follow" method="Post">
                    <input type="submit" value="follow" class="btn btn-outline-dark btn-sm">
                  </form>
                <% end %>
            <% end %>
          </div>
        </div>

      </div>
    </div>
  </div>

  <div class="row">
    <% @user.posts.order(:created_at).each do |post| %>
      <div class="col-sm-6 col-md-4 col-lg-3">

        <div class="card border-info mb-3">

            <div class="image-modal">
              <% if post.pic_link %>
                <img src="<%=post.pic_link%> " alt="<%=post.pic_link%>" class="img-fluid myImg mx-auto d-block img-main">
              <% else %>
                <img src="<%=post.image_url%> " alt="<%=post.image_url%>" class="img-fluid myImg mx-auto d-block img-main">
              <% end %>
              <div class="moda myModa">
                <span class="close">&times;</span>
                <img src="" class="moda-content img01" >
                <div class="caption"></div>
              </div>
            </div>

            <div class="row">

              <div class="col d-flex justify-content-center  px-0">
                <% if favorited?(post) %>
                  <form action="/favorite" method="Post">
                    <input type="hidden" name="post_id" value="<%=post.id%>">
                    <button type="submit" class="btn btn-outline-success fs"><i class="fa fa-star" aria-hidden="true"></i></i></button>
                  </form>
                <% else %>
                  <form action="/favorite" method="Post">
                    <input type="hidden" name="post_id" value="<%=post.id%>">
                    <button type="submit" class="btn btn-outline-success fso"><i class="fa fa-star-o" aria-hidden="true"></i></button>
                  </form>
                <% end %>
              </div>

              <div class="col d-flex justify-content-center  px-0">
                  <span class="like-count d-flex align-items-center mx-auto"><%= post.likes.total_count %></span>
              </div>

              <div class="col d-flex justify-content-center  px-0">
                <% if liked?(post) %>
                  <form action="/like/Post/<%=post.id%>" method="post">
                    <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                  </form>
                <% else %>
                  <form action="/like/Post/<%=post.id%>" method="post">
                    <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                  </form>
                <% end %>
              </div>

            </div>

            <div class="info">
              <span class="name">
                <a href="/users/<%=post.author.id%>">
                  <%=post.author.username%>:
                </a>
              </span>

              <span class="description">
                <a href="/posts/<%=post.id%>">
                    <% if post.description && post.description.length > 50 %>
                      <%=post.description[0..50]%>...
                    <% else %>
                      <%=post.description%>
                    <% end %>
                </a>
              </span>

              <div class="float-right comments">
                <% if post.comments.any? %>
                  <a href="/posts/<%=post.id%>">
                    <span><i class="fa fa-comments" aria-hidden="true"></i></span>
                  </a>
                <% else %>
                  <a href="/posts/<%=post.id%>">
                    <span><i class="fa fa-comments-o" aria-hidden="true"></i></span>
                  </a>
                <% end %>
              </div>

            </div>

        </div>

      </div>
    <% end %>
  </div>

</cfoutput>
