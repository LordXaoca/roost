package {
    import flash.display.Sprite;

    import starling.core.Starling;

    public class Root extends Sprite {

        private var _starling:Starling;

        public function Root() {
            _starling = new Starling(StarlingRoot, stage);
            _starling.start();
        }

    }
}
