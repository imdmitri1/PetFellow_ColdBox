


<div class="row">
  <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div class="col-sm-12 col-md-8 col-lg-8">

    <h3 class="text-center">create new post!</h3>

      <!--- <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %> --->

      <!--- <form action="/posts" method="Post" enctype="multipart/form-data"> --->
        <!--- <!-- for saving links manually: --> --->
        <!--- <!-- <label for="pic_link">link</label> --->
        <!--- <input type="text" placeholder="link" name="pic_link" value="<%=@post.pic_link%>"> --> --->
          <div class="form-group">
            <label for="photo[image]">Choose file</label>
            <!--- <input name="photo[image]" type="hidden" value="<%= @post.cached_image_data %>"> --->
            <input name="photo[image]" type="file"  class="form-control">
          </div>
          <div class="form-group">
            <label for="photo[description]">Description</label>
            <!--- <textarea name="photo[description]" class="form-control" rows="4"><%=@post.description%></textarea> --->
          </div>

        <input type="submit" value="post" class="form-control btn btn-success">
      </form>

    </div>
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>
