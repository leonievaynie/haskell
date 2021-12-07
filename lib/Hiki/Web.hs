{-# LANGUAGE OverloadedStrings #-}

module Hiki.Web where
import           Web.Scotty
import           Control.Monad.IO.Class (liftIO)
import           Data.List (intersperse)
import qualified Data.Text.Lazy as LT

type Html = String 


main :: IO ()
main = scotty 3000 $ do
  get "/styles.css" $ do
    setHeader "Content-Type" "text/css"
    file "static/styles.css"

  get "/" indexHtml

htmlString :: String -> ActionM ()
htmlString = html . LT.pack

indexHtml :: ActionM () 
indexHtml = htmlString $ e "h1" "HiKi"

nbsp :: Html
nbsp = "&nbsp;"

-- Creates an element
e :: String -> Html -> Html
e tag kids = ea tag [] kids

-- Creates an element with attributes
ea :: String -> [(String, String)] -> Html -> Html
ea tag attrs kids = concat $ ["<", tag] ++ attrsHtml attrs ++ [">", kids, "</", tag, ">"]
  where attrsHtml [] = []
        attrsHtml as = " " : intersperse " " (map attrHtml as)
        attrHtml (key, value) = key ++ "='" ++ value ++ "'"
