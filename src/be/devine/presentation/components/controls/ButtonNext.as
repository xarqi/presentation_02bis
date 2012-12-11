/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 4/12/12
 * Time: 14:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components.controls {
import be.devine.presentation.model.AppModel;

import starling.display.Button;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class ButtonNext extends Button
{
    [Embed(source = '../assets/controls/arrows.xml', mimeType="application/octet-stream")]
    public static const ButtonArrowXML:Class;

    [Embed(source = '../assets/controls/arrows.png')]
    public static const ButtonArrowTextures:Class;

    private var _appModel:AppModel;

    private var _texture:Texture;
    private var _xml:XML;
    private var _textureAtlas:TextureAtlas;
    private var _frames:Vector.<Texture>;

    public function ButtonNext()
    {
        this._appModel = AppModel.getInstance();

        _texture = Texture.fromBitmap(new ButtonArrowTextures());
        _xml = XML(new ButtonArrowXML());
        _textureAtlas = new TextureAtlas(_texture, _xml);

        _frames = _textureAtlas.getTextures('arrow');

        super(_frames[2], '', _frames[3]);

        this.addEventListener(starling.events.TouchEvent.TOUCH, touchHandler);
    }

    private function touchHandler(event:starling.events.TouchEvent):void
    {
        if(event.getTouch(this, starling.events.TouchPhase.HOVER))
        {
            this.upState = _frames[3];
        }
        else
        {
            this.upState = _frames[2];
        }

        if(event.getTouch(this, starling.events.TouchPhase.ENDED))
        {
            _appModel.nextSlide();
        }
    }
}
}
