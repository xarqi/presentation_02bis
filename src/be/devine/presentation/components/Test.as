/**
 * Created with IntelliJ IDEA.
 * User: alexander
 * Date: 11/12/12
 * Time: 14:49
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components {
import starling.display.Sprite;
import starling.text.TextField;

public class Test extends Sprite{

    private var txt:TextField;

    public function Test() {
        this.txt = new TextField(100,20, "lalalal");
        addChild(this.txt);
    }
}
}
