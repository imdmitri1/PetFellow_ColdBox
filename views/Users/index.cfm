<cfoutput>

   <div class="jumbotron jumbotron-fluid">
       <p class="display-4 text-success"><em>All users:</em> </p>
   </div>

    <div class="row">
      <% @users.each do |user| %>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card border-info mb-3">

            <a href="/users/<%=user.id%>"><img src="<%= user.avatar %>" alt="<%= user.avatar %>" class="img-fluid">   </a>
            <a href="/users/<%=user.id%>">Username: <%= user.username %>  </a>

          </div>
        </div>
      <% end %>
    </div>

</cfoutput>
