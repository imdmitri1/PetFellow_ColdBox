
<!--- <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %> --->

<div class="row">
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div class="col-sm-12 col-md-8 col-lg-8">

    <h3 class="text-center">edit post!</h3>

    <!--- <form action="/posts/<%=@post.id%>" method="Post"> --->
      <input type="hidden" name="_method" value="Put">
      <!--- <!-- for saving links manually: --> --->
      <!--- <!-- <label for="pic_link">link</label> --->
      <!--- <input type="text" placeholder="link" name="pic_link" value="<%=@post.pic_link%>"> --> --->
      <div class="form-group">
        <label for="description">Description</label>
        <!--- <textarea name="description"  class="form-control" rows="4"><%=@post.description%></textarea> --->
      </div>

      <input type="submit" value="save"  class="form-control btn btn-success">
    </form>

  </div>
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>
