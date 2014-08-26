DEPLOYURL=komik.meteor.com
cd app && meteor deploy --settings private/config/prod.json $DEPLOYURL
# curl "http://redes.meteor.com/datapack/server/reload" &
meteor logs $DEPLOYURL
