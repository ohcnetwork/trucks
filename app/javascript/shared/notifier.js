import PNotify from "pnotify/dist/es/PNotify";
/*purgecss start ignore*/
import "pnotify/dist/PNotifyBrightTheme.css";
/*purgecss end ignore*/
const notify = (title, text, type) => {
  const notification = PNotify.alert({
    type: type,
    title: title,
    text: text,
    styling: "brighttheme",
    buttons: {
      closer: false,
      sticker: false
    }
  });
  notification.refs.elem.addEventListener("click", () => {
    notification.close();
  });
};

export default notify;
