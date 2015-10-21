package {
    import roost.Roost;
    import roost.loaders.IBundleLoader;

    import starling.display.Sprite;
    import starling.events.Event;

    public class StarlingRoot extends Sprite {

        public function StarlingRoot() {
            Roost.setup();
            Roost.templates
                    .addBundle("assets/templates/base-layout.zip")
                    .addBundle("assets/templates/base-layout.zip")
                    .load();

            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            var loader:IBundleLoader = Roost.addTemplatesBundle("assets/templates/base-layout.zip");
            loader.addEventListener(Event.COMPLETE, onLoadComplete);
            loader.addEventListener(Event.IO_ERROR, onIoError);
            loader.addEventListener(Event.PARSE_ERROR, onParseError);
            loader.load();
        }

        private function onLoadComplete(event:Event):void {
            trace(">> all load fine");
        }

        private function onIoError(event:Event):void {
            trace(">> cannot load bundle", event.data);
        }

        private function onParseError(event:Event):void {
            trace(">> cannot parse bundle data");
        }
    }
}
