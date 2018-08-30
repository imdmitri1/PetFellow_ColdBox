<cfoutput>

  <div class="row">
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
    <div class="col-sm-12 col-md-8 col-lg-8">

      <h3 class="text-center"> Edit your profile:</h3>

      <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %>

      <form action="/users/<%=@user.id%>" method="Post">
         <input type="hidden" name="_method" value="Put">
         <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" placeholder="name" name="user[name]" value="<%=@user.name%>">
          </div>
          <!-- <div class="form-group">
           <label for="user[image]">Choose file</label>
           <input name="user[image]" type="hidden" value="<%= @user.cached_image_data %>">
           <input name="user[image]" type="file"  class="form-control">
         </div> -->
         <div class="form-group">
            <label for="username">Avatar</label>
            <input type="text" class="form-control" placeholder="avatar" name="user[avatar]" value="<%=@user.avatar%>">
          </div>
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" placeholder="username" name="user[username]" value="<%=@user.username%>">
          </div>
          <div class="form-group">
            <label for="username">Bio</label>
            <input type="text" class="form-control" placeholder="bio" name="user[bio]" value="<%=@user.bio%>">
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="mail" class="form-control" placeholder="email" name="user[email]" value="<%=@user.email%>">
          </div>
          <input type="submit" value="save" class="form-control btn btn-success">
      </form>

        <form action="/users/<%=@user.id%>" method="Post">
          <div class="form-group">
            <input type="hidden" name="_method" value="delete">
            <input type="submit" value="delete account" class="btn btn-sm btn-link">
          </div>
        </form>

    </div>
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>

</cfoutput>
