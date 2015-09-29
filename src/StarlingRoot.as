package {
    import by.roost.Roost;

    import starling.display.Sprite;
    import starling.events.Event;

    public class StarlingRoot extends Sprite {

        public function StarlingRoot() {
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
//            Roost.setup();
            Roost.load("path", onLoadHandler);
        }

        private function onLoadHandler(success:Boolean):void {

        }
    }
}
