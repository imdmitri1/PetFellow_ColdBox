<cfoutput>

  <div class="row">
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
    <div class="col-sm-12 col-md-8 col-lg-8">

      <h3 class="text-center">Create new comment:</h3>

      <%= erb :'partials/_errors', layout: false, locals: {errors: @errors} %>

      <form action="/posts/<%=@post.id%>/comments" method="Post">
        <div class="form-group">
          <label for="comment">Comment</label>
          <textarea name="comment" class="form-control" placeholder="your comment here..." rows="8"><%=@comment.content%></textarea>
        </div>
        <input type="submit" value="add comment" class="btn btn-success">
      </form>

    </div>
    <div class="col-sm-12 col-md-2 col-lg-2"></div>
  <div>

</cfoutput>
