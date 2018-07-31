
## Installation

You would need to have  [CommandBox](http://www.ortussolutions.com/products/commandbox) installed on your machine to run this app.  

Navigate to the project folder in CommandBox environment and type:

```
server start
```

This will run the application. Then you would need to paste 'sqlite-jdbc-3.14.2.1.jar' file from db folder into specified directory for database to work, here is the path, you can find in your CommandBox environment while server is running:
```
 /Users/{'username'}/.CommandBox/server/E222EA50114A5CB34992E598DA1B9D35-petfellow_coldbox/lucee-5.2.7.63/WEB-INF/lucee-web/lib
```
After you add the `jar` file, you will need to restart your server for it to take effect:
```
server restart
```
