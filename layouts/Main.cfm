<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>PetFellow</title>
  <meta name="description" content="PetFellow - social network for pet lovers!">
  <meta name="keywords" content="pictures,photo,pets,fellow,cats,dogs,cute">
  <meta name="author" content="imdmitri1">
  <!--- <META NAME="ROBOTS" CONTENT="INDEX, FOLLOW"> --->
  <link rel="shortcut icon" href="/includes/images/favicon.png" type="image/x-icon" />
  <link rel="stylesheet" href="/includes/css/normalize.css">
  <link rel="stylesheet" href="/includes/css/bootstrap.min.css">
  <link rel="stylesheet" href="/includes/css/application.css">
	<!--- <base href="#event.getHTMLBaseURL()#" /> --->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Cabin+Sketch|Open+Sans" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
  <link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.css">
  <meta property="og:title" content="PetFellow" />
  <meta property="og:type" content="website" />
  <!--- <meta property="og:url" content="https://petfellow.herokuapp.com/" /> --->
  <meta property="og:description" content="PetFellow - social network for pet lovers!" />
  <meta property="og:site_name" content="PetFellow" />
  <script src="/includes/js/cookies_min.js"></script>
  <!--- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-113297884-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
  </script> --->
</head>
<body>
  <div class="container body main-cont2">

    <nav class="navbar navbar-expand-md navbar-light bg-light p-1 px-2 mb-3 rounded border">

        <a class="navbar-brand my-0 py-0 h1" href="/"><span class="PF"><i class="fa fa-paw paw" aria-hidden="true"></i> PetFellow</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

          <ul class="navbar-nav ">

              <li class="nav-item d-flex justify-content-end align-items-center">
                <div>
                  <form class="form-inline one-line" action="/search" method="get">
                    <input class="form-control form-control-sm" type="search" aria-label="search" type="text" name="request" placeholder="search">
                    <button class="btn btn-outline-secondary btn-sm" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                  </form>
                </div>
              </li>

              <!--- <cfif logged_in?> --->

                <li class="nav-item dropdown d-flex justify-content-end">
                  <a class="nav-link dropdown-toggle" href="##" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Profile
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/users/<%= current_user.id %>" class="nav-link" ><i class="fa fa-user" aria-hidden="true"></i> profile page</a>
                    <a class="dropdown-item" href="/posts/new" class="nav-link"><i class="fa fa-plus" aria-hidden="true"></i> new post</a>
                    <a class="dropdown-item" href="/favorite" class="nav-link"><i class="fa fa-star-half-o" aria-hidden="true"></i> favorite posts</a>
                    <a class="dropdown-item" href="/messages" class="nav-link"><i class="fa fa-envelope" aria-hidden="true"></i> messages</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/users/<%=current_user.id%>/edit" class="nav-link"><i class="fa fa-cogs" aria-hidden="true"></i> edit profile</a>
                    <div class="dropdown-divider"></div>
                    <form method="post" action="/sessions">
                      <input type="hidden" name="_method" value="DELETE" />
                      <button type="submit" class="btn btn-link dropdown-item"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</button>
                    </form>
                  </div>
                </li>
                 <!--- <script>
                   var expDate = new Date();
                   expDate.setDate(expDate.getDate() + 1);
                   docCookies.setItem("user", "logged_in!", expDate);
                 </script> --->

              <!---  <cfelse> --->

                <!--- <script>
                  docCookies.removeItem("user")
                </script> --->

                <li  class="nav-item d-flex justify-content-end"><a href="/sessions/new" class="nav-link pading-right">Login</a> <a href="/users/new" class="nav-link">Sign Up</a></li>

              <!--- </cfif> --->

            </ul>

          </div>

      </nav>

			<div>#renderView()#</div>

  </div>

  <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  <script src="/includes/js/bootstrap.bundle.min.js"></script>
  <script src="/includes/js/application.js"></script>

</body>
</html>
</cfoutput>
