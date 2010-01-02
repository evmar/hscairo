-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.Cairo.Internal.Surfaces.Xlib
-- Copyright   :  (c) 2010 Evan Martin
-- License     :  BSD-style (see COPYRIGHT)
--
-- Rendering to memory buffers.
-----------------------------------------------------------------------------

module Graphics.Rendering.Cairo.Internal.Surfaces.Xlib where

import Foreign
import Foreign.C
import Graphics.X11.Types
import Graphics.X11.Xlib.Types

{#import Graphics.Rendering.Cairo.Types#}

#include <cairo/cairo-xlib.h>
{#context lib="cairo" prefix="cairo"#}

displayPtr (Display p) = castPtr p
visualPtr (Visual p) = castPtr p
screenPtr (Screen p) = castPtr p
{#fun xlib_surface_create as ^ { displayPtr `Display', fromIntegral `Drawable', visualPtr `Visual', `Int', `Int' } -> `Surface' mkSurface* #}
{#fun xlib_surface_create_for_bitmap as ^ { displayPtr `Display', fromIntegral `Pixmap', screenPtr `Screen', `Int', `Int' } -> `Surface' mkSurface* #}
{#fun xlib_surface_set_size as ^ { withSurface* `Surface', `Int', `Int' } -> `()' #}
{#fun xlib_surface_set_drawable as ^ { withSurface* `Surface', fromIntegral `Drawable', `Int', `Int' } -> `()' #}

-- TODO: all the getters.
