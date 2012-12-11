/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 27/11/12
 * Time: 14:03
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.vo
{
public class SlideVO
{
    private var _xml:XML;

    public function SlideVO(xml:XML)
    {
        this._xml = xml;
    }

    public function get xml():XML
    {
        return _xml;
    }
}
}
