cd /home/erpy/tomcat/bin && sh shutdown.sh
git fetch; git pull
mvn clean; mvn compile; mvn package;
rm -rf /home/erpy/tomcat/webapps/BoardWangWeb
rm -rf /home/erpy/tomcat/webapps/BoardWangWeb.war
cp -f /home/erpy/BoardWangWeb/source/BoardWangWeb/target/BoardWangWeb.war /home/erpy/tomcat/webapps
cd /home/erpy/tomcat/bin && sh start.sh