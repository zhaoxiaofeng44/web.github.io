<!--
//
//===============================[������Ϣ����Ȩ����]===================================
//ExoBUD MP(II) v4.1tc+ [Sample Chinese Version]
//Copyright(Pe) 1999-2004 Jinwoong Yu[ExoBUD], yune_lee[liyu.net]
//======================================================================================
//����ԭ����: ������(Jinwoong Yu) 
//������վ: http://exobud.nayana.org 
//�����ʼ�: exobud@hanmail.net
//�������Ļ�����: liyu(yune_lee)
//������վ: http://www.liyu.net
//�����ʼ�: yune_lee@163.net
//0ICQ �˺�: 4410162
//��������: 2003.01.10(�˰汾ԭ���İ�) 
//��������: 2003.05.22(���������׸��汾)
//======================================================================================
//��Ȩ���С�
//   �������ǻ۲Ʋ�Ȩ�� �������Ա����� ExoBUD MP(II) ���κ��޸ġ�����(����)��壬����
//*����*�����˶ΰ�Ȩ��������ݣ���������(�����)ԭ���߼����Ļ����ߵ����ֺ���վ���ᡣ
// �������Ҫ�Է������İ��������İ�ĳ���Ϊ������������������Եİ汾����������������
//�ϣ��������������޸Ĺ��İ汾�����������Դ��͵����ʼ��ķ�ʽ���������ǵ�ͬ�⡣
//  �벻Ҫ������(�����)ԭ���߻����Ļ����ߵ����ָĳ����Լ������֣�Ȼ������һ������������
//�������������Ϲ�������ɢ����������Ϊ�������ص���Ȩ��Ϊ��
//  ���ǹ�����ѳ��������벻Ҫʹ������ҵ��;�ϡ�
//  ���⣬���಻�ɽ�������(ȫ���򲿷�)���Ƶ���������ý��(�������Ƭ)��������������;��
//  ������Ϊʹ�ñ��������������������ʧ����٣�����ԭ���߼����Ļ����߾����ö��为��
//===============================[���(Skin)������Ϣ]===================================
//ExoBUD MP(II) v4.1tc+ �������(www.dearfish.com) 
//�ر��л����������������(www.liyu.net)�ṩ����������أ�
//��ӭ��Ҳι۷���Ŀ�վ--www.dearfish.com
//===============================[ע������]=============================================
//  ����㲻��ʮ����Ϥhtml��JavaScript���ԣ��벻Ҫ�޸����µĴ��룬����ʮ��������ɳ����
//�󡣵����޸ı������ԭʼ��ʱ����ע��ִ���޸ĺ�ĳ��򣬿��ܻᵼ��һЩ����ִ���е�Ӧ�ó�
//���޷�����������������Ҫ������JavaScript����ʹ�õı������ƺ��趨ֵ����Сд���зֱ�ġ�
//======================================================================================
var objMmInfo = null;
var intMmCnt = 0;
var intSelMmCnt = 0;
var intActMmCnt = 0;
var cActIdx = 0;
var cActTit = "nAnT";
var strMmInfo = "ExoBUD ý�嵵����Ϣ";
var blnfpl = false;
var blnEnabled = false;
var blnEOT = false;
var arrSelMm = null;
var arrActMm = null;
var intExobudStat = 0;
var tidTLab = null;
var tidErr = null;
var tidMsg = null;
var intErrCnt = 0;
var blnRept = false;
// ���ǡ��Զ��������š����趨��һ����˵������һ��������Ϻ�ͻ��Զ�������һ�ס�
// ���������Ҫ���ŵ�ý������Ѷ����(����:MV)�Ļ�����ý�����趨ֵ��Ϊ false ��
// true = �Զ���������
// false = ��Ҫ�Զ��������ţ���ʹ����������ѡ��һ����Ŀ
var blnAutoProc = true;
// �趨�������������ʾ��ʱ�䳤�ȣ�Ԥ������������ʽ(Elapse)�ֻ�����ʽ(Lapse)��ʾ��
// true = ��������ʽ��ʾʱ�䳤�ȣ�����̬����ʾ��Ŀ�Ѳ��ŵ�ʱ��
// false = �Ե�����ʽ��ʾʱ�䳤�ȣ�����̬����ʾ��Ŀʣ���ʱ��
var blnElaps = true;
// �趨����ÿ����Ŀ֮����ӳ�ʱ��(Delay Time)����λ�Ǻ���(msec)��
// ÿ100�������0.1�룬Ĭ��ֵ��500����(��0.5��)������ҲҪ��Ϊ100���롣
var intDelay = 500;
// wmpInit() ��ʽ: ʹ�� wmp-obj v7.x ���ӿ⽨�������趨
function wmpInit(){
var wmps = Exobud.settings;
var wmpc = Exobud.ClosedCaption;
wmps.autoStart = true;
wmps.balance = 0;
wmps.enableErrorDialogs = false;
wmps.invokeURLs = false;
wmps.mute = false;
wmps.playCount = 1;
wmps.rate = 1;
wmps.volume = 100;
if(blnUseSmi){wmpc.captioningID="capText"; capText.style.display="";}
Exobud.enabled = true;
}
// mkMmPath() ��ʽ: ׼������ Multi-object ������
function mkMmPath(u,t,f,s){
this.mmUrl = u;
this.mmTit = t;
this.mmDur = 0;
this.selMm = f;
this.actMm = f;
if(blnUseSmi){this.mmSmi=s;}
}
// mkList() ��ʽ: ���� Multi-object ������
function mkList(u,t,s,f){
var cu = u;
var ct = t;
var cs = s;
var cf = f;
var idx = 0;
if(objMmInfo == null){objMmInfo=new Array(); idx=0;}
else {idx=objMmInfo.length;}
if(u=="" || u==null){cu="mms://";}
if(t=="" || t==null){ct="nAnT";}
if(f=="f" || f=="F"){cf="f";}
else {cf="t"; intSelMmCnt++;}
if(blnUseSmi){
objMmInfo[idx]=new mkMmPath(cu,ct,cf,cs);
} else {
objMmInfo[idx]=new mkMmPath(cu,ct,cf);
}
intActMmCnt = intSelMmCnt;
intMmCnt = objMmInfo.length;
}
// mkSel() ��ʽ: ������ѡȡ������Ŀ(Selected Media)������
function mkSel(){
arrSelMm = null;
intSelMmCnt = 0;
var selidx = 0;
if(intMmCnt<=0){intExobudStat=1; blnEnabled=false; return;} // û���κβ����嵥��Ŀ
arrSelMm = new Array();
for(var i=0; i<intMmCnt; i++){
if(objMmInfo[i].selMm =="t"){arrSelMm[selidx]=i;selidx++;}
}
intSelMmCnt=arrSelMm.length;
if(intSelMmCnt<=0){blnEnabled=false; intExobudStat=2; arrSelMm=null; return;}
else {blnEnabled=true; mkAct();}
}
// mkAct() ��ʽ: ���������ò�����Ŀ(Activated Media)������
function mkAct(){
arrActMm = null;
intActMmCnt = 0;
var selidx = 0;
var actidx = 0;
if(blnEnabled){
arrActMm=new Array();
for(var i=0; i<intSelMmCnt; i++){
selidx=arrSelMm[i];
if(objMmInfo[selidx].actMm=="t"){arrActMm[actidx]=selidx; actidx++;}
}
intActMmCnt=arrActMm.length;
}
else { return;}
if(intActMmCnt<=0){blnEOT=true;arrActMm=null;}
else {blnEOT=false;}
}
// chkAllSel() ��ʽ: ȫ��ѡȡ���еĲ����嵥��Ŀ
function chkAllSel(){
for(var i=0; i<intMmCnt; i++){
objMmInfo[i].selMm="t";
objMmInfo[i].actMm="t";
}
mkSel();
}
// chkAllDesel() ��ʽ: ��ѡȡ���еĲ����嵥��Ŀ
function chkAllDesel(){
for(var i=0; i<intMmCnt; i++){
objMmInfo[i].selMm="f";
objMmInfo[i].actMm="f";
}
mkSel();
}
// chkItemSel() ��ʽ: ѡȡ��ѡȡ�����嵥��Ŀ
function chkItemSel(idx){
if(objMmInfo[idx].selMm =="t"){
objMmInfo[idx].selMm="f";objMmInfo[idx].actMm="f";
} else {
objMmInfo[idx].selMm="t";objMmInfo[idx].actMm="t";
}
mkSel();
}
// chkItemAct() ��ʽ: ��ĳ�������ò�����Ŀ(Activated Media)����
function chkItemAct(idx){
objMmInfo[idx].actMm="f";
mkAct();
}
// mkSelAct() ��ʽ: ����ѡȡ������Ŀ(Selected Media)���뵽�����ò�����Ŀ(Activated Media)
function mkSelAct(){
var idx=0;
for(var i=0; i<intSelMmCnt; i++){
idx=arrSelMm[i];
objMmInfo[idx].actMm="t";
}
mkAct();
}
// initExobud() ��ʽ: ��ʼ�� ExoBUD MP(II) ý�岥�ų���
function initExobud(){
wmpInit();
mkSel();
blnfpl = false;
if(!blnShowVolCtrl) {
document.images['vmute'].style.display = "none";
document.images['vdn'].style.display = "none";
document.images['vup'].style.display = "none";
}
if(!blnShowPlist){ document.images['plist'].style.display = "none";}
if(blnRept){imgChange('rept',1);}
else {imgChange('rept',0);}
if(blnRndPlay){imgChange('pmode',1);}
else {imgChange('pmode',0);}
showTLab();
disp1.innerHTML = "ý�岥�ų���__������ͷ";
if(blnStatusBar){ window.status=('ý�岥�ų���__������ͷ');}
if(blnAutoStart){startExobud();}
}
// startExobud() ��ʽ: ��ʼ������Ŀ
function startExobud(){
var wmps = Exobud.playState;
if(wmps==2){Exobud.controls.play(); return;}
if(wmps==3){ return;}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
if(intErrCnt>0){intErrCnt=0;tidErr=setTimeout('retryPlay(),1000');return;}
if(blnRndPlay){rndPlay();}
else {cActIdx=arrActMm[0]; selMmPlay(cActIdx);}
}
// selMmPlay() ��ʽ: ����ý�����
function selMmPlay(idx){
clearTimeout(tidErr);
cActIdx=idx;
var trknum=idx+1;
var ctit =objMmInfo[idx].mmTit;
if(ctit=="nAnT"){ctit="(û��ý�����)"}
if(blnUseSmi){Exobud.ClosedCaption.SAMIFileName = objMmInfo[idx].mmSmi;}
Exobud.URL = objMmInfo[idx].mmUrl;
cActTit = "T" + trknum + ". " + ctit;
disp1.innerHTML = cActTit;
if(blnStatusBar){ window.status=(cActTit);}
chkItemAct(cActIdx);
}
// wmpPlay() ��ʽ: ʹ�� wmp-obj v7.x ���ӿⲥ����Ŀ
function wmpPlay(){Exobud.controls.play();}
// wmpStop() ��ʽ: ֹͣ������Ŀ����ʾ��������״̬ѶϢ
function wmpStop(){
intErrCnt=0;
clearTimeout(tidErr);
clearInterval(tidTLab);
imgChange("stopt",1);
imgChange("pauzt",0);
imgChange("scope",0);
showTLab();
mkSelAct();
Exobud.controls.stop();
Exobud.close();
disp1.innerHTML = "ý�岥�ų��� [����]";
if(blnStatusBar){ window.status=('ý�岥�ų��� [����]');return true;}
}
// wmpPause() ��ʽ: ʹ�� wmp-obj v7.x ���ӿ���ͣ������Ŀ
function wmpPause(){Exobud.controls.pause();}
// wmpPP() ��ʽ: ����ͣ���źͼ�������֮������л�
function wmpPP(){
var wmps = Exobud.playState;
var wmpc = Exobud.controls;
clearInterval(tidTLab);
clearTimeout(tidMsg);
if(wmps==2){wmpc.play();}
if(wmps==3){wmpc.pause(); disp2.innerHTML="��ͣ"; tidMsg=setTimeout('rtnTLab()',1500);}
return;
}
// rndPlay() ��ʽ: �������(Random Play)�����㷽ʽ
function rndPlay(){
if(!blnEnabled){waitMsg();return;}
intErrCnt=0;
var idx=Math.floor(Math.random() * intActMmCnt);
cActIdx=arrActMm[idx];
selMmPlay(cActIdx);
}
// playAuto() ��ʽ: �������ò�����Ŀ���С��Զ��������š��Ĵ���
// ���Ǹ������� blnAutoProc ���趨ֵ�������Ķ�����
function playAuto(){
if(blnRept){selMmPlay(cActIdx);return;}
if(!blnAutoProc){wmpStop();return;}
if(blnfpl){wmpStop();return;}
if(!blnEnabled){wmpStop();return;}
if(blnEOT){
if(blnLoopTrk){startExobud();}
else {wmpStop();}
} else {
if(blnRndPlay){rndPlay();}
else {cActIdx=arrActMm[0]; selMmPlay(cActIdx);}
}
}
// ����ʹ�����ڲ����嵥������ѡ�ĵ�һ��Ŀ
function selPlPlay(idx){
blnfpl=true;
selMmPlay(idx);
}
// playPrev() ��ʽ: ������һ�������ò�����Ŀ
function playPrev(){
var wmps = Exobud.playState;
if(wmps==2 || wmps==3){Exobud.controls.stop();}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
intErrCnt=0;
if(blnRndPlay){rndPlay();}
else {
var idx=cActIdx;
var blnFind=false;
for(var i=0;i<intSelMmCnt;i++){ if(cActIdx==arrSelMm[i]){idx=i-1; blnFind=true;}}
if(!blnFind){startExobud();return;}
if(idx<0){idx=intSelMmCnt-1;cActIdx=arrSelMm[idx];}
else {cActIdx=arrSelMm[idx];}
selMmPlay(cActIdx);
}
}
// playNext() ��ʽ: ������һ�������ò�����Ŀ
function playNext(){
var wmps = Exobud.playState;
if(wmps==2 || wmps==3){Exobud.controls.stop();}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
intErrCnt=0;
if(blnRndPlay){rndPlay();}
else {
var idx=cActIdx;
var blnFind=false;
for(var i=0;i<intSelMmCnt;i++){ if(cActIdx==arrSelMm[i]){idx=i+1; blnFind=true;}}
if(!blnFind){startExobud();return;}
if(idx>=intSelMmCnt){idx=0;cActIdx=arrSelMm[idx];}
else {cActIdx=arrSelMm[idx];}
selMmPlay(cActIdx);
}
}
// retryPlay() ��ʽ: �ٴγ���������ý�嵵��
function retryPlay(){
selMmPlay(cActIdx);
}
// chkRept() ��ʽ: �л��Ƿ��ظ�����Ŀǰ����Ŀ(�����ò�����Ŀ)
function chkRept(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnRept){
blnRept=false; imgChange('rept',0); disp2.innerHTML="���ظ�����";
} else {
blnRept=true; imgChange('rept',1); disp2.innerHTML="�ظ�����";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// chgPMode() ��ʽ: �л���ѭ��(Sequential)�ֻ����(Random)�ķ�ʽ������ý����Ŀ
function chgPMode(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnRndPlay){
blnRndPlay=false; imgChange('pmode',0); disp2.innerHTML="ѭ�򲥷�";
} else {
blnRndPlay=true; imgChange('pmode',1); disp2.innerHTML="�������";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// evtOSChg() ��ʽ: �Ե������ڷ�ʽ��ʾý�嵵����Ϣ
function evtOSChg(f){
// ������״ֵ̬ (f) ��˵��:
// 0(δ����) 8(ת��ý����) 9(Ѱ��ý����) 10(����ý����) 11(����ý����)
// 12(����ý����) 13(ý���ѿ���) 20(�ȴ�������) 21(���ڿ�������������)
if(f==8){capText.innerHTML="ExoBUD MP(II) ��Ļ��ʾϵͳ(SMI)";}
if(f==13){
var strTitle = Exobud.currentMedia.getItemInfo("Title");
if(strTitle.length <= 0){strTitle = "(δ�����ı���)"}
var strAuthor = Exobud.currentMedia.getItemInfo("Author");
if(strAuthor.length <= 0){strAuthor = "(δ�������ݳ���)"}
var strCopy = Exobud.currentMedia.getItemInfo("Copyright");
if(strCopy.length <= 0){strCopy = "(û������Ȩ��Ϣ)"}
var strType = Exobud.currentMedia.getItemInfo("MediaType");
var strDur = Exobud.currentMedia.durationString;
var strUrl = Exobud.URL;
var trknum = cActIdx+1;
var ctit = objMmInfo[cActIdx].mmTit;
if(ctit=="nAnT"){
objMmInfo[cActIdx].mmTit = strAuthor + " - " + strTitle;
ctit = strAuthor + " - " + strTitle;
cActTit = "T" + trknum + ". " + ctit;
disp1.innerHTML = cActTit;
}
strMmInfo = "�������⣺ " + strTitle + " (��ʽ: " + strType +")" + "\n\n";
strMmInfo += "���ݳ��ߣ� " + strAuthor + "\n\n";
strMmInfo += "����λ�ã� " + strUrl + "\n\n";
strMmInfo += "������Ȩ�� " + strCopy + "\n\n";
strMmInfo += "ʱ�䳤�ȣ� " + strDur + "\n\n\n";
strMmInfo += "���� Brought to you by ExoBUD MP(II).\n";
strMmInfo += "���� Copyright(C) 1999-2003 Jinwoong Yu.\n";
strMmInfo += "���� ALL RIGHTS RESERVED.\n";
if(blnShowMmInfo){alert(strMmInfo);}
}
}
// evtPSChg() ��ʽ: �л����ų���Ķ���
function evtPSChg(f){
// ������״ֵ̬ (f) ��˵��:
// 0(δ����) 1(��ֹͣ����) 2(����ͣ����) 3(���ڲ�����) 4(��ǰ����) 5(�������)
// 6(���崦����) 7(�ȴ���) 8(�Ѳ������) 9(ת����Ŀ��) 10(����״̬)
switch(f){
case 1:
evtStop();
break;
case 2:
evtPause();
break;
case 3:
evtPlay();
break;
case 8:
setTimeout('playAuto()', intDelay);
break;
}
}
// evtWmpBuff() ��ʽ: ��ý�嵵�����л��崦��(Buffering)�Ķ���
function evtWmpBuff(f){
if(f){
disp2.innerHTML = "���崦����";
var msg = "(���崦����) " + cActTit;
disp1.innerHTML = msg;
if(blnStatusBar){ window.status=(msg);}
} else {
disp1.innerHTML = cActTit; showTLab();
}
}
// evtWmpError() ��ʽ: ���޷�������ý�嵵��ʱ����ʾ����ѶϢ
function evtWmpError(){
intErrCnt++;
Exobud.Error.clearErrorQueue();
if(intErrCnt<=3){
disp2.innerHTML = "�������� (" + intErrCnt + ")";
var msg = "(���Ե� " + intErrCnt + " ������) " + cActTit;
disp1.innerHTML = "<�޷�����> " + cActTit;
if(blnStatusBar){ window.status=(msg);}
tidErr=setTimeout('retryPlay()',1000);
} else {
clearTimeout(tidErr);
intErrCnt=0;showTLab();
var msg = "�ѷ������������������ڽ��Ქ����һ����Ŀ��";
if(blnStatusBar){ window.status=(msg);}
setTimeout('playAuto()',1000);}
}
// evtStop() ��ʽ: ֹͣ����
function evtStop(){
clearTimeout(tidErr);
clearInterval(tidTLab);
showTLab();
intErrCnt=0;
imgChange("pauzt",0);
imgChange("playt",0);
imgChange("scope",0);
disp1.innerHTML = "ExoBUD MP(II) v4.1tc+ [�ȴ�������һ����Ŀ]";
if(blnStatusBar){ window.status=('ExoBUD MP(II) v4.1tc+ [�ȴ�������һ����Ŀ]');return true;}
}
// evtPause() ��ʽ: ��ͣ����
function evtPause(){
imgChange("pauzt",1)
imgChange("playt",0);
imgChange("stopt",0);
imgChange("scope",0);
clearInterval(tidTLab);
showTLab();
}
// evtPlay() ��ʽ: ��ʼ����
function evtPlay(){
imgChange("pauzt",0)
imgChange("playt",1);
imgChange("stopt",0);
imgChange("scope",1);
tidTLab=setInterval('showTLab()',1000);
}
// showTLab() ��ʽ: ��ʾʱ�䳤��
function showTLab(){
var ps = Exobud.playState;
if(ps==2 || ps==3){
var cp=Exobud.controls.currentPosition;
var cps=Exobud.controls.currentPositionString;
var dur=Exobud.currentMedia.duration;
var durs=Exobud.currentMedia.durationString;
if(blnElaps){
disp2.innerHTML = cps + " | " + durs;
var msg = cActTit + " (" + cps + " | " + durs + ")";
if(ps==2){msg = "(��ͣ) " + msg;}
if(blnStatusBar){ window.status=(msg);return true;}
} else {
var laps = dur-cp;
var strLaps = wmpTime(laps);
disp2.innerHTML = strLaps + " | " + durs;
var msg = cActTit + " (" + strLaps + " | " + durs + ")";
if(ps==2){msg = "(��ͣ) " + msg;}
if(blnStatusBar){ window.status=(msg);return true;}
}
} else {
disp2.innerHTML = "00:00 | 00:00";
}
}
// chgTimeFmt() ��ʽ: ���ʱ�䳤�ȵ���ʾ��ʽ
function chgTimeFmt(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnElaps){
blnElaps=false; disp2.innerHTML="������ʽ";
} else {
blnElaps=true; disp2.innerHTML="������ʽ";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// rtnTLab() ��ʽ: ����ʱ�䳤��
function rtnTLab(){
clearTimeout(tidMsg);
var wmps = Exobud.playState;
if(wmps==3){tidTLab=setInterval('showTLab()',1000);}
else {showTLab();}
}
// wmpTime() ��ʽ: ����ʱ�䳤��
function wmpTime(dur){
var hh, min, sec, timeLabel;
hh=Math.floor(dur/3600);
min=Math.floor(dur/60)%60;
sec=Math.floor(dur%60);
if(isNaN(min)){ return "00:00";}
if(isNaN(hh) || hh==0){timeLabel="";}
else {
if(hh>9){timeLabel = hh.toString() + ":";}
else {timeLabel = "0" + hh.toString() + ":";}
}
if(min>9){timeLabel = timeLabel + min.toString() + ":";}
else {timeLabel = timeLabel + "0" + min.toString() + ":";}
if(sec>9){timeLabel = timeLabel + sec.toString();}
else {timeLabel = timeLabel + "0" + sec.toString();}
return timeLabel;
}
// wmpVolUp(), wmpVolDn(), wmpMute() �⼸������������У�����ĺ�ʽ��(��λ����)
// vmax �����������(100), vmin ������С����(0), vdep �����У�����ļ��(������Ϊ5��20֮��)
// ��ֻ������ vmin, vmax, vdep ��Ϊ0��100֮���������ֵ��vmin �� vdep ��ֵ�����Դ�� vmax��
var vmax = 100;
var vmin = 0;
var vdep = 10;
// wmpVolUp() ��ʽ: ��������(Volume Up)
function wmpVolUp(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
var ps = Exobud.settings;
if(ps.mute){ps.mute=false; disp2.innerHTML="�����ָ�"; imgChange('vmute',0);}
else {
if(ps.volume >= (vmax-vdep)){ps.volume = vmax;}
else {ps.volume = ps.volume + vdep;}
disp2.innerHTML = "����: " + ps.volume + "%";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// wmpVolDn() ��ʽ: ��������(Volume Down)
function wmpVolDn(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
var ps = Exobud.settings;
if(ps.mute){ps.mute=false; disp2.innerHTML="�����ָ�"; imgChange('vmute',0);}
else {
if(ps.volume <= vdep){ps.volume = vmin;}
else {ps.volume = ps.volume - vdep;}
disp2.innerHTML = "����: " + ps.volume + "%";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// wmpMute() ��ʽ: ����ģʽ(Mute)
function wmpMute(){
var wmps = Exobud.playState;
if(wmps==3){clearInterval(tidTLab);}
var ps = Exobud.settings;
if(!ps.mute){
ps.mute=true; disp2.innerHTML="��������ģʽ"; imgChange("vmute",1);
} else {
ps.mute=false; disp2.innerHTML="�رվ���ģʽ"; imgChange("vmute",0);
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// waitMsg() ��ʽ: ��ʾ�򲥷��嵥�հ׶��޷����ŵ�ѶϢ
function waitMsg(){
capText.innerHTML="ExoBUD MP(II) ��Ļ��ʾϵͳ(SMI)";
if(intExobudStat==1){disp1.innerHTML = "�޷����� �� �����嵥��û���趨�κ���Ŀ��";}
if(intExobudStat==2){disp1.innerHTML = "�޷����� �� ��û��ѡȡ�����嵥���κ�һ����Ŀ��";}
if(blnStatusBar){
if(intExobudStat==1){ window.status=('�޷����� �� �����嵥��û���趨�κ���Ŀ��'); return true;}
if(intExobudStat==2){ window.status=('�޷����� �� ��û��ѡȡ�����嵥���κ�һ����Ŀ��'); return true;}
}
}
// openPlist() ��ʽ: �Ե���������ʾ�����嵥����
function openPlist(){
window.open("exobudpl.htm","mplist","top=120,left=320,width=300,height=480,scrollbars=no,resizable=yes,copyhistory=no");
}
// chkWmpState() ��ʽ: �����ų��������ʱ������ playState ��״ֵ̬
function chkWmpState(){
// ������״ֵ̬��˵��:
// 0(δ����) 1(��ֹͣ����) 2(����ͣ����) 3(���ڲ�����) 4(��ǰ����) 5(�������)
// 6(���崦����) 7(�ȴ���) 8(�Ѳ������) 9(ת����Ŀ��) 10(����״̬)
return Exobud.playState;
}
// chkWmpOState() ��ʽ: �����ų�����ý�嵵��׼������ʱ������ openState ��״ֵ̬
function chkWmpOState(){
// ������״ֵ̬��˵��:
// 0(δ����) 8(ת��ý����) 9(Ѱ��ý����) 10(����ý����) 11(����ý����)
// 12(����ý����) 13(ý���ѿ���) 20(�ȴ�������) 21(���ڿ�������������)
return Exobud.openState;
}
// chkOnline() ��ʽ: ���ʹ���ߵ�����״̬ (��һ��ÿ����嶼��ʹ��)
function chkOnline(){
// ����ֵ: true(����������������) false(û����������������)
return Exobud.isOnline;
}
// vizExobud() ��ʽ: ��ѡ���� ExoBUD MP ������ԭ���ߵĹٷ���վ[����] (��һ��ÿ����嶼��ʹ��)
function vizExobud(){
// ʹ�÷���: <span onClick="vizExobud()" style="cursor:hand" title="���� ExoBUD MP ԭ���� Jinwoong Yu ����վ [����]">
window.open("http://exobud.nayana.org","vizExobud");
}
//-->
 
