module UI (runUI) where

import Brick
import Brick.Widgets.Border
import Brick.Widgets.Center
import Graphics.Vty.Attributes

ui :: Widget ()
ui = withAttr titleAttr . center . hLimit 30 . border . center $ str "Casesar Cipher CLI"

app :: App () () ()
app = App
  { appDraw   = const [ui]
  , appChooseCursor = neverShowCursor
  , appHandleEvent = \_ e-> case e of 
      VtyEvent (EvKey KEsc []) -> Halt ()
      _ -> continue ()
  , appStartEvent = return 
  , appAttrMap = const $ attrMap defAttr [(titleAttr, fg brightBlue)]
  }

titleAttr :: AttrName
titleAttr = "title"

runUI :: IO () 
runUI = do
  _ <- defaultMain app ()
  reutnr ()
