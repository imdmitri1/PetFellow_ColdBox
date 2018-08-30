<cfoutput>
  
  <div class="row auth ">
    <div class="col-sm-12 col-md-3 col-lg-3"></div>
    <div class="col-sm-12 col-md-6 col-lg-6 ">
      <h3>Please register</h3>

      <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %>

      <form action="/users" method="Post">

        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" class="form-control" name="user[username]" placeholder="Username" value="<%=@user.username%>">
        </div>

        <div class="form-group">
          <label for="email">Email address</label>
          <input type="email" class="form-control" name="user[email]" placeholder="Enter email" value="<%=@user.email%>">
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" name="user[password]" placeholder="Password">
        </div>

        <button type="submit" class="btn btn-info">Register</button>
      </form>

      <a href="/sessions/new" class="btn btn-link">or login</a>

    </div>
    <div class="col-sm-12 col-md-3 col-lg-3"></div>
  </div>

</cfoutput>
