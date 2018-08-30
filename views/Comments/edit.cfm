<cfoutput>

  <div class="row">
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
    <div class="col-sm-12 col-md-8 col-lg-8">

      <h3 class="text-center">Edit comment:</h3>

      <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %>

      <form action="/posts/<%=@post.id%>/comments/<%=@comment.id%>" method="Post">
        <input type="hidden" name="_method" value="put">

        <div class="form-group">
          <label for="comment">Comment</label>
          <textarea name="comment" class="form-control" rows="8"><%=@comment.content%></textarea>
        </div>
        <input type="submit" value="edit comment" class="btn btn-success">
      </form>

    </div>
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>

</cfoutput>
