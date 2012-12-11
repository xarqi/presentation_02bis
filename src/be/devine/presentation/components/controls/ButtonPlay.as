/**
 * Created with IntelliJ IDEA.
 * User: alexander
 * Date: 11/12/12
 * Time: 15:00
 * To change this template use File | Settings | File Templates.
 */

package be.devine.presentation.components.controls {
import be.devine.presentation.model.AppModel;

import starling.display.Button;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class ButtonPlay extends Button
{
    [Embed(source = '../assets/controls/buttonplay.xml', mimeType="application/octet-stream")]
    public static const ButtonArrowXML:Class;

    [Embed(source = '../assets/controls/buttonplay.png')]
    public static const ButtonArrowTextures:Class;

    private var _appModel:AppModel;

    private var _texture:Texture;
    private var _xml:XML;
    private var _textureAtlas:TextureAtlas;
    private var _frames:Vector.<Texture>;

    public function ButtonPlay()
    {
        this._appModel = AppModel.getInstance();

        _texture = Texture.fromBitmap(new ButtonArrowTextures());
        _xml = XML(new ButtonArrowXML());
        _textureAtlas = new TextureAtlas(_texture, _xml);

        _frames = _textureAtlas.getTextures('buttonPlay');

        super(_frames[0], '', _frames[1]);

        this.addEventListener(starling.events.TouchEvent.TOUCH, touchHandler);
    }

    private function touchHandler(event:starling.events.TouchEvent):void
    {
        if(event.getTouch(this, starling.events.TouchPhase.HOVER))
        {
            this.upState = _frames[1];
        }
        else
        {
            this.upState = _frames[0];
        }

        if(event.getTouch(this, starling.events.TouchPhase.ENDED))
        {
            _appModel.nextSlide();
        }
    }
}
}
