Users
<cfquery name = "a">
    SELECT * FROM Users
</cfquery>
<cfdump var='#a#'>

Posts
<cfquery name = "b">
    SELECT * FROM Posts
</cfquery>
<cfdump var='#b#'>

FavoritePosts
<cfquery name = "d">
    SELECT * FROM FavoritePosts
</cfquery>
<cfdump var='#d#'>

Comments
<cfquery name = "e">
    SELECT * FROM Comments
</cfquery>
<cfdump var='#e#'>

PostLikes
<cfquery name = "g">
    SELECT * FROM PostLikes
</cfquery>
<cfdump var='#g#'>

CommentLikes
<cfquery name = "h">
		SELECT * FROM CommentLikes
</cfquery>
<cfdump var='#h#'>

Messages
<cfquery name = "i">
	SELECT * FROM Messages
</cfquery>
<cfdump var='#i#'>

Follows
<cfquery name = "k">
    SELECT * FROM Follows
</cfquery>
<cfdump var='#k#'>
