<cfoutput>

   <div class="jumbotron jumbotron-fluid">
       <p class="display-4 text-success"><em>Followings:</em> </p>
   </div>

    <div class="row">
      <% if @user.followings.any? %>
      <% @user.followings.each do |following| %>
              <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-info mb-3">

                  <a href="/users/<%=following.id%>"><img src="<%= following.avatar %>" alt="<%= following.avatar %>" class="img-fluid">   </a>
                  <a href="/users/<%=following.id%>">Username: <%= following.username %>  </a>

                </div>
              </div>
            <% end %>
      <% else %>

        <p class="d-flex align-items-center mx-auto">you're not following anybody yet...</p>

      <% end %>

    </div>

</cfoutput>
