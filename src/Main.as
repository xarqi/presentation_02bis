package {

import be.devine.presentation.Application;

import flash.display.Screen;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import starling.core.Starling;

public class Main extends Sprite
{
    private var _starling:Starling;


    public function Main()
    {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.color=0xECECEC;
        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 1024;
        stage.nativeWindow.height = 786;
        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - stage.nativeWindow.width) / 2;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - stage.nativeWindow.height) / 2;
        stage.nativeWindow.title ="Presentation Engine 02";

        _starling = new Starling(Application, stage);
        _starling.start();
    }
}
}
