//
// 设定播放清单内容
//
//   完整的设定格式: mkList("媒体档案位置","媒体标题","字幕档案位置","冻结旗标(f)");
//   一般的设定格式: mkList("媒体档案位置","媒体标题");
//   预设不播放某项目: mkList("媒体档案位置","媒体标题","", "f");
//   自动取得媒体信息: mkList("媒体档案位置");
//
//   注1: 第二个设定值(媒体标题)一般的格式是「演出者 - 曲目标题」。
//   注2: 第四个设定值(冻结旗标/Frozen Flag)是以 f 字符来表示预设不选取播放此媒体档案。

// 设定播放清单项目时，请注意以下各项：
//
//    1. 如果您使用相对路径(Relative Path)的方式来设定档案位置，请最好在连结前面使用如 ./ 或 ../ 来示意目前
//       所在的资料夹。当您以绝对路径(Absolute Path)的方式来设定连结时，除了 http:// 或 ftp:// 之外，您也可
//       使用如 mms:// 或 rtsp:// 这些串流处理媒体的通讯协议。
//
//    2. 如果您想要使用字幕功能，媒体项目的第一个设定值(媒体档案位置)或第三个设定值(字幕档案位置)其中一项，
//       必须使用绝对路径的方式来设定连结，否则字幕功能只会在本机运作，而在远程服务器却失效的。此外，与媒体
//       档案相连的字幕档案，最好要符合这两个条件： 1.存放在相同的资料夹； 2.以相同的档名来命名。例如：媒体
//       档名为 xyz.wmv 就使用 xyz.smi 的字幕档案。假如字幕文件名跟媒体文件名不一样，您必须在播放清单项目设定中
//       加入第三个设定值(字幕档案位置)，但毋须加入路径。以下的设定范例说明了上述各点：
//
//         例1: mkList("http://mydomain.com/exobud/video/xyz.wmv","我的生活片段");
//              解说 - 字幕档案 xyz.smi 存放在相同的资料夹，则毋须设定「字幕档案位置」。
//         例2: mkList("http://mydomain.com/exobud/video/xyz.wmv","我的生活片段","abc.smi");
//              解说 - 字幕档案存放在相同的资料夹，但文件名有别，须设定字幕档名。
//         例3: mkList("./music/xyz.wma","演出者 - 歌名","http://others.net/lyric/xyz.smi");
//              解说 - 字幕档案存放在不同的主机，必须使用绝对路径的方式来设定「字幕档案位置」。
//         例4: mkList("http://others.net/music/xyz.wma","演出者 - 歌名");
//              解说 - 媒体档案与字幕档案俱存放在不同的主机，同时又符合相同资料夹及文件名的条件。
//
//    3. 使用全英文小写半角字元的档案路径永远是最保险的做法，因为可以保证在大部份情况下都能够正常读取连结。
//       请尽量避免使用包含双字节字符 (例如中文字或韩文字) 、特殊字符或半角空白的连结；如果可以的话，在设定
//       连结时，最好将这些文字转换成『％句柄』，例如将半角空白写成 %20 。
//
//    4. 当您在设定媒体标题时，可能会遇上一些跟简体中文 (gb2312) 不同语系的文字，例如韩文或日文。如果您决定要
//       保留媒体原本的语文做为媒体标题，请先将这些文字转换成像 &#12345; 的『＆句柄』(即Unicode/万国码)，
//       然后才好写到媒体标题的设定值里去，否则这些外语文字是无法在播放面板或播放清单上正确显示出来的。
//
//    5. 如果您使用以「自动取得媒体信息」的方式来读取媒体标题的信息，即在播放清单项目里只填写媒体档案位置，
//       媒体标题则预设显示为「未指定媒体标题(等待自动取得媒体信息)」。在准备开始播放该曲目时，程序才会读取
//       媒体信息，然后在播放面板及播放清单显示出来。(当播放器所在的页面重新整理后，便会回复到原来的状态。)
//
//    6. 因为本程序是利用微软的 Windows Media Player 做为后台播放程序，所以并不支持以 .ra .rm .rv .ram 这些
//       由 RealNetworks 制订的媒体格式来播放音讯或视讯内容。请不要在播放清单项目中加入这些媒体档案。另外，
//       本程序虽然支持微软最新开发的「Windows Media 播放清单」档案格式 (扩展名为 .wpl)，但是因为此格式尚未
//       开发成熟，而本程序对此格式的支持可能不够完全，所以建议使用者应避免使用这种档案来制作播放清单，除非
//       您是本程序的开发人员／面板制作者，或对程序运作已有深入了解。
//
//    7. 另外要留意播放清单代码的大小写是有分别的，mkList中的"L"一定要大写，否则会出错。

//    以上为说明文档，你可以在使用播放器时删除(包括本行在内)，这样可以提高播放器提取播放清单的速度。下面为播放清单代码：


mkList("http://218.200.117.2:9080/editor/UploadFile/200652152416480.mp3","香水有毒—胡杨林");
mkList("http://60.22.23.141:2006/mp3/hnv/wz/2/3.wma","一杯咖啡到天亮—王筝");
mkList("http://www.cnzjyh.com/music/xznsbz.mp3","想着你睡不着—王筝");
mkList("http://210.61.218.1/grm.cdn.hinet.net/xuite/a/9/2/0/14756428/blog_297116/dv/6133759/6133759.mp3","我的乖—王筝");
mkList("http://210.61.218.1/grm.cdn.hinet.net/xuite/a/9/2/0/14756428/blog_297116/dv/6133352/6133352.mp3","我的心你什么时候还我—王筝");
mkList("http://www.hebtrans.com/dns.mp3","对你说—王筝");
mkList("http://www.fifamp3.com:8080/download/emedia_seeds/xx/wz/loveyoumoncheri.mp3","爱你mon cheri—王筝");
mkList("http://218.30.20.121:5699/youhm/shirenyl/02.wma","诗人的眼泪—游鸿明");
mkList("http://cnc.uumusic.net/wma2005/0177/ZP06.Wma","船歌—赵鹏");
mkList("http://wma.kv120.com/wma/157.wma","婴儿—陈倩倩");