/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 27/11/12
 * Time: 17:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components.textutils
{
import starling.display.Sprite;
import starling.text.TextField;

public class TextFieldUtil extends starling.display.Sprite
{
    [Embed(source='../../components/assets/fonts/homestead.ttf', embedAsCFF="false", fontFamily='Homestead')]
    private static const Homestead:Class;

    public function TextFieldUtil(width:Number, height:Number, text:String, size:int, isCenter:Boolean = false)
    {
        var textField:starling.text.TextField = new TextField(width, height, text, 'Homestead', size);

        if(!isCenter)
        {
            textField.hAlign = 'left';
            textField.vAlign = 'top';
        }

        addChild(textField);
    }
}
}
