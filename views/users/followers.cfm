<cfoutput>

  <div class="jumbotron jumbotron-fluid">
      <p class="display-4 text-success"><em>Followers:</em> </p>
  </div>

   <div class="row">
     <% if @user.followers.any? %>
     <% @user.followers.each do |follower| %>
             <div class="col-sm-6 col-md-4 col-lg-3">
               <div class="card border-info mb-3">

                 <a href="/users/<%=follower.id%>"><img src="<%= follower.avatar %>" alt="<%= follower.avatar %>" class="img-fluid">   </a>
                 <a href="/users/<%=follower.id%>">Username: <%= follower.username %>  </a>

               </div>
             </div>
           <% end %>
     <% else %>

       <p class="d-flex align-items-center mx-auto">no followers yet...</p>

     <% end %>

   </div>

</cfoutput>
