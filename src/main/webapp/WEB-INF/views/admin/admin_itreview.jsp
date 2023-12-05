<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="robots" content="noindex">
	<!--<link href="http://cocoaphp.com/publish/bootstrap/css/material-design-iconic-font.min.css" rel="stylesheet">-->
	<script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8" style="z-index: 1100;"></script><script async="" src="https://www.clarity.ms/s/0.7.8/clarity.js"></script><script type="text/javascript" async="" src="//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js"></script><script async="" src="https://www.clarity.ms/tag/gy4ajmqjno"></script><script>
		var TEST_SERVER = false;
		var VENDOR_DOMAIN = 'https://vendor-cdn.imweb.me';
		var UPLOAD_URL = '/upload/';
		var CDN_UPLOAD_URL = 'https://cdn.imweb.me/upload/';
		var IS_MAIN = false;
		var IS_MOBILE = false;
		var ADMIN_URL = '/admin/';
		var THUMBNAIL_URL= '/thumbnail/';
		var CDN_THUMBNAIL_URL= 'https://cdn.imweb.me/thumbnail/';
		var SITE_CODE = 'S20230724b38d1d4688d7b';
		var UNIT_CODE = 'u2023072464bdcddc323fa';
		var SITE_NO = 'S20230724b38d1d4688d7b';
		var UNIT_NO = 'u2023072464bdcddc323fa';
		var MAIN_DOMAIN = 'yeonhee0623.imweb.me';
		var CURRENT_DOMAIN = 'yeonhee0623.imweb.me';
		var CURRENT_PROTOCOL = 'https://';
		var GOOGLE_API_KEY = 'AIzaSyA8CCexf9XTJcH09mStr-HRW4nin4k8J7w';
		var FROALA_VERSION = 311;
		var FROALA_KEY = '6LF5g1B3D3F3C6C3E2F-11SLJCKHXOSLMc1YGSGb1ZXHSe1CgB5A4D4C3E3C2A13A19B7B2==';
		var ADOBE_AVIARY_KEY = '94bd22b5cc05424494c5e7aeabab8466';
		var LIMIT_API_LIST = [];
		var NO_IMAGE_URL = '/img/no-image.png';
		var ADMIN_LANG_CODE = 'KR';
		var SITE_COUNTRY_CODE = 'kr';
		var KOREA_COUNTRY_CODE = 'kr';
		var TAIWAN_COUNTRY_CODE = 'tw';
		var IS_GUEST = false;
		var MEMBER_HASH = '79d7d33ef5293db5f0f7a53fd3914eae219aaf59';
		var CHECK_OFFICE = false;

                    /****************************************************************/
            /* m_Completepayment  설명                                      */
            /****************************************************************/
            /* 인증완료시 재귀 함수                                         */
            /* 해당 함수명은 절대 변경하면 안됩니다.                        */
            /* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다.    */
            /* Web 방식의 경우 리턴 값이 form 으로 넘어옴                   */
            /* EXE 방식의 경우 리턴 값이 json 으로 넘어옴                   */
            /****************************************************************/
            function m_Completepayment( FormOrJson, closeEvent )
            {
                var frm = document.order_info;

                /********************************************************************/
                /* FormOrJson은 가맹점 임의 활용 금지                               */
                /* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다.  */
                /* FormOrJson 값을 활용 하시려면 기술지원팀으로 문의바랍니다.       */
                /********************************************************************/
                GetField( frm, FormOrJson );


                if( frm.res_cd.value == "0000" )
                {
                    /*
                     가맹점 리턴값 처리 영역
                     */

                    frm.submit();
                }
                else
                {
                    alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );

                    closeEvent();
                }
            }
        	</script>
    <script type="text/javascript">
        if(TEST_SERVER){
            // (function(c,l,a,r,i,t,y){
            //     c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
            //     t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
            //     y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
            // })(window, document, "clarity", "script", "gy49b26ww7");
        }else{
            (function(c,l,a,r,i,t,y){
                c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
                t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
                y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
            })(window, document, "clarity", "script", "gy4ajmqjno");
        }
    </script>

	<script src="/js/localize/KR_KRW_currency.js?1687935649"></script><script src="/js/localize/admin/KR.js?1687935651"></script>
	<link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/bootstrap.css?1630317764"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/jquery-ui.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/ii.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/db-icons.css?1688371447"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/material-design-iconic-font.min.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/bootstrap-datepicker.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/black-tie.css?1608189400"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/simple-line-icons.css?1608179394"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/fonts/im-icon/style.css?1671430692"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/fonts/pretendard/web/variable/pretendardvariable.css?1669875619"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/fonts/pretendard/web/static/pretendard.css?1669875619"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/fonts/froala-emoji-tap/style.css?1669163161"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/preloader.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/owl.carousel2.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/slick.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/animate.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/nprogress.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/trackpad-scroll-emulator.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/font-awesome.min.css?1626931454"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/font-awesome5.min.css?1669163183"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/froala_311/css/froala_editor.pkgd.css?1669163161"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/froala_311/css/froala_style.min.css?1669163161"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/emoji.css?1669163161"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/froala/custom-theme-v3.css?1669163161"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/colorpicker.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/codemirror.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/bootstrap-spinner.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/chosen.css?1617331870"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/fullcalendar.min.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/morris.core.css?1577682282"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/lightgallery.min.css?1596596378"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/im_component.css?1636689958"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/admin.css?1671429817"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/toastr.css?1593569516"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/alarm_menu.css?1678083003"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/fonts/fontello/src/css/fontello.css?1669066661"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/bootstrap-theme-dashboard.css?1618365623"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/dashboard.css?1689645674"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/select2.css?1590627710"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/site/admin/accordion.css?1653367465"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/regularly.css?1669066892"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/tailwind.css?1689126958"><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/swiper.min.css?1652070481"><script src="https://vendor-cdn.imweb.me/js/jquery.js?1627517460"></script><script src="https://vendor-cdn.imweb.me/js/jquery.browser.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery-ui.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/bootstrap.min.js?1630317768"></script><script src="https://vendor-cdn.imweb.me/js/floating-ui-core@1.0.1.js?1669067096"></script><script src="https://vendor-cdn.imweb.me/js/floating-ui-dom@1.0.1.js?1669067096"></script><script src="https://vendor-cdn.imweb.me/js/tinycolor-min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/im_component.js?1636940317"></script><script src="https://vendor-cdn.imweb.me/js/admin_common.js?1677450225"></script><script src="https://vendor-cdn.imweb.me/js/table_list.js?1633057104"></script><script src="https://vendor-cdn.imweb.me/js/data.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/owl.carousel2.js?1638150602"></script><script src="https://vendor-cdn.imweb.me/js/slick.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/preloader.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.lazyload.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.trackpad-scroll-emulator.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.fileupload.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/nprogress.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/froala_editor.min.js?1608673099"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/align.min.js?1607673165"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/char_counter.min.js?1607673165"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/code_beautifier.min.js?1607673167"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/code_view.min.js?1608643124"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/colors.min.js?1607673167"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/draggable.min.js?1607673168"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/emoticons.min.js?1669163161"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/entities.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/file.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/font_family.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/font_size.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/forms.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/fullscreen.min.js?1607673170"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/image.min.js?1607673172"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/image_manager.min.js?1607673172"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/inline_style.min.js?1607673173"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/line_breaker.min.js?1607673173"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/link.min.js?1607673173"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/lists.min.js?1607673174"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/paragraph_format.min.js?1607673174"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/paragraph_style.min.js?1607673174"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/quote.min.js?1607673174"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/save.min.js?1607673174"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/table.min.js?1607673177"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/url.min.js?1607673177"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/video.min.js?1625125569"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/plugins/line_height.min.js?1607673173"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/third_party/font_awesome.min.js?1607673192"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/languages/ko.js?1669875597"></script><script src="https://vendor-cdn.imweb.me/froala_311/js/languages/zh_tw.js?1669875597"></script><script src="https://vendor-cdn.imweb.me/js/jquery-scrolltofixed-min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/colorpicker.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.chosen.js?1619084781"></script><script src="https://vendor-cdn.imweb.me/js/jquery.timepicker.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.print.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/autolinker.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/ThreeCanvas.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/snow.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/lightgallery-all.min.js?1596595980"></script><script src="https://vendor-cdn.imweb.me/js/autosize.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/froala_with_emoticon.js?1669875619"></script><script src="https://vendor-cdn.imweb.me/js/common.js?1689021244"></script><link rel="stylesheet" type="text/css" href="https://vendor-cdn.imweb.me/css/lightgallery.css?1577682282"><script src="https://vendor-cdn.imweb.me/js/jquery.nestable.doznut.js?1666824024"></script><script src="https://vendor-cdn.imweb.me/js/jquery.number.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/masonry.pkgd.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/Chart.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/swiper-bundle.min.js?1669875597"></script><script src="https://vendor-cdn.imweb.me/js/jquery.autosize.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/codemirror.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/mode/xml/xml.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/mode/javascript/javascript.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/mode/css/css.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/mode/htmlmixed/htmlmixed.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.select2.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.select2_ko.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/imagesloaded.pkgd.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.nanoscroller.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/html5shiv.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/jquery.validate.js?1621218311"></script><script src="https://vendor-cdn.imweb.me/js/jquery.inputmask.bundle.min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/moment-with-locales.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/js/moment-timezone.js?1581998425"></script><script src="https://vendor-cdn.imweb.me/js/bootstrap-datepicker.js?1687222780"></script><script src="https://vendor-cdn.imweb.me/js/ie-checker-min.js?1577682292"></script><script src="https://vendor-cdn.imweb.me/dist/fe-common.min.js?1671431247"></script><script src="https://vendor-cdn.imweb.me/js/excel-password.js?1671429942"></script><script src="https://vendor-cdn.imweb.me/js/payment_password/payment_password.js?1677564584"></script><script src="https://vendor-cdn.imweb.me/js/lodash.min.js?1656295899"></script><script src="/admin/js/doz_post.js?1577682293"></script><script src="/admin/js/admin.js?1689021236"></script><script src="/admin/js/coupon.js?1687465591"></script><script src="/admin/js/doznut.js?1666824024"></script><script src="/admin/js/event_check.js?1585896056"></script><script src="/js/site_member.js?1669876617"></script><script src="/js/alarm_menu.js?1683615433"></script><script src="/admin/js/imweb_analytics.js?1604543771"></script><script src="/admin/js/site_manage.js?1669163183"></script><script src="/admin/js/admin_search.js?1639983006"></script><script src="/admin/js/dashboard.js?1684993985"></script><script src="/admin/js/config.js?1688535036"></script><script src="/admin/js/member.js?1689858633"></script><script src="/admin/js/permission.js?1686703958"></script><script src="/admin/js/contents.js?1682296151"></script><script src="/admin/js/payment.js?1676962420"></script><script src="/admin/js/toastr.js?1577682293"></script><script src="/admin/js/contents_list.js?1673856329"></script><script src="/admin/js/shop.js?1679873040"></script><script src="/admin/js/shop_point.js?1678082378"></script><script src="/admin/js/shop_order.js?1679899144"></script><script src="/admin/js/shop_shipping.js?1687222780"></script><script src="/admin/js/excel_download_form.js?1669875619"></script><script src="/admin/js/mixpanel.js?1689576745"></script><script src="//unpkg.com/vue@3/dist/vue.global.prod.js"></script><script src="https://vendor-cdn.imweb.me/js/axios.min.js"></script><script>var IS_ANDROID_APP = 'N';
	(function(){
		var customTooltipAllowList = $.fn.tooltip.Constructor.DEFAULTS.whiteList;
		customTooltipAllowList.table = [];
		customTooltipAllowList.thead = [];
		customTooltipAllowList.tbody = [];
		customTooltipAllowList.tr = [];
		customTooltipAllowList.td = ["rowspan", "colspan"];
		customTooltipAllowList.th = [];
		customTooltipAllowList.caption = [];
		customTooltipAllowList["*"].push("style");
	})();

function determineDropDirection(){
    var $window = $(window);
    var window_height = $window.innerHeight();
    var window_scrolltop = $window.scrollTop();
	$(".dropdown-menu").each( function(){
	    var $that = $(this);
		$that.css({
			visibility: "hidden",
			display: "block"
		});
		$that.parent().removeClass("dropup");

        /* 드롭다운 하단에 공간이 없을 경우 상단에 공간이 있다면 방향 전환 */
		if ($that.offset().top + $that.outerHeight() + 60 > window_height + window_scrolltop && $that.offset().top > $that.outerHeight() + 60){
			$that.parent().addClass("dropup");
		}
		$that.removeAttr("style");
	});
}

determineDropDirection();

$(window).scroll(determineDropDirection);
	</script></head>


<body class="menubar-hoverable header-fixed menubar-pin">
                <!-- BEGIN BASE-->
    <div id="dashboard_loader" class="se-pre-con" style="display: none">
        <div class="page-loader-spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
        <div class="progress">
            <div class="progress-bar" role="progressbar" style="width:70%">
                <label>70%</label>
            </div>
        </div>
    </div>
    <div id="base">
            
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const alertBox = document.querySelector('#alertBox');
            const contentArea = document.querySelector('#content');
            alertBox.classList.remove('alert__wrap-fixed');
            alertBox.classList.add('alert__wrap');
            if ( contentArea ) contentArea.prepend(alertBox);
        });
    </script>        <!-- END OFFCANVAS LEFT --><script type="text/javascript">
	$(function(){
		SADMIN_MENU_ALERT.openAlert();
	});
</script>
<header class="top_header" id="header">
	<div class="headerbar">
		<div class="headerbar-left">
			<ul class="header-nav header-nav-options">
				<li class="hidden-lg hidden-md">
					<a class="btn btn-icon-toggle menubar-toggle" data-toggle="menubar" href="javascript:void(0);">
						<i class="btl bt-bars"></i>
					</a>
				</li>
				<li class="header-nav-brand">
					<div class="brand-holder">
						<span class="location_text">
							<a href="/admin/shopping/review">구매평 관리</a>						</span>
					</div>
				</li>
			</ul>
		</div>

		<div class="headerbar-right">
			<ul class="header-nav header-nav-options _option_list">
									<a class="btn btn-default-bright" href="javascript:;" onclick="alert('구매평 일괄 추가 기능은 Pro, Global 버전에서만 사용 가능합니다.')">구매평 일괄 추가</a>
							</ul><!--end .header-nav-options -->
		</div><!--끝 #header-navbar-collapse -->
		<!--끝 #header-navbar-collapse -->
	</div>
</header>
<header class="top_header control-fixed" id="select_header" style="display: none;">
	<div class="headerbar">
		<div class="headerbar-left">
			<ul class="header-nav">
				<li class="header-nav-brand">
					<div class="brand-holder ">
						<a class="btn btn-flat btn-default-white no-padding-x margin-right-xl" href="javascript:;" onclick="CONTENTS_LIST.cancelCheckItem()"><i class="btm bt-arrow-left"></i></a>
					</div>
					<div class="brand-holder">
						<div class="dropdown pull-left">
							<button class="btn btn-flat btn-default-white no-padding-x margin-right-xl text-lg" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown" type="button" id="dLabel">
								<span id="select_cnt"></span>개 선택됨								<i class="zmdi zmdi-caret-down"></i>
							</button>
							<ul aria-labelledby="dLabel" role="menu" class="dropdown-menu animation-dock">
								<li>
									<a href="javascript:;" onclick="CONTENTS_LIST.cancelCheckItem()">선택 안함</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="headerbar-right">
			<ul class="header-nav header-nav-options">
				<li>
					<div class="btn-group">
						<a data-toggle="dropdown" class="btn btn-default-bright border-radius-right">베스트/워스트							<i class="zmdi zmdi-caret-down"></i></a>
						<ul aria-labelledby="dLabel" role="menu" class="dropdown-menu animation-dock check">
							<li>
								<a href="#" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.updateReviewLevel('best',codes);})">베스트 지정</a>
							</li>
							<li>
								<a href="#" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.updateReviewLevel('worst',codes);})">워스트 지정</a>
							</li>
							<hr style="margin-bottom: 5px; margin-top: 5px">
							<li>
								<a href="#" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.updateReviewLevel('release',codes);})">베스트/워스트 지정 해제</a>
							</li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn btn-default-bright" href="javascript:;" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.updateReviewPoint(codes);})"><span class="hidden-xs">적립금 지급 승인</span></a>
					</div>
					<div class="btn-group">
						<a class="btn btn-default-bright" href="javascript:;" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.openDeleteReviewForm(codes,'N');})"><span class="hidden-xs">구매평 삭제</span></a>
					</div>
				</li>
				<li>
					<div class="admin_contents_header_action dropdown">
						<button class="btn btn-flat" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown" type="button" id="dLabel">
							<i class="zmdi zmdi-more" style="color:#fff"></i>
						</button>
						<ul aria-labelledby="dLabel" role="menu" class="dropdown-menu animation-dock">
							<li>
								<a href="javascript:;" onclick="CONTENTS_LIST.checkActionWithReviewCode(function(codes){SHOP_REVIEW_MANAGE.updateReviewWtimeForm(codes);})"><span class="hidden-xs">작성시각 수정</span></a>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</header>
<!-- BEGIN CONTENT-->
<div id="content"><div id="alertBox" class="alert__wrap">    </div>
	<section>
		<div class="section-body">
			<div class="row">
				<div id="contents_list_wrap" class="col-md-9 col-sm-12">
					<div class="holder prod-search-form">
						<div class="dropdown card rev-filter" style="padding:0;">
							<button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="form-control rev-filter-btn" style="height: 48px !important;">
								<span style="padding-left: 20px;">필터</span>
								<div class="caret"></div>
							</button>
							<ul class="dropdown-menu" role="menu">
								<form id="search_review_form" method="post" tabindex="hidden_frame">
									<li class="rev-list">
										<div class="down-btn">
											<select class="form-control" name="review_rating" id="review_rating" onclick="event.cancelBubble=true;" autocomplete="off">
												<option value="">별 점수</option>
																									<option value="1">1점</option>
																										<option value="2">2점</option>
																										<option value="3">3점</option>
																										<option value="4">4점</option>
																										<option value="5">5점</option>
																								</select>
										</div>
									</li>
									<li class="rev-list">
										<div class="down-btn">
											<select class="form-control" name="review_type" id="review_type" onclick="event.cancelBubble=true;" autocomplete="off">
												<option value="">구매평 유형</option>
												<option value="normal">일반 구매평</option>
												<option value="photo">포토 구매평</option>
											</select>
										</div>
									</li>
									<li class="rev-list">
										<div class="down-btn">
											<select class="form-control" name="order_type" id="order_type" onclick="event.cancelBubble=true;" autocomplete="off">
												<option value="">주문 유형</option>
												<option value="npay">네이버페이</option>
                                                <option value="talkpay">카카오 페이구매</option>
												<option value="normal">일반</option>
											</select>
										</div>
									</li>
									<li class="rev-list">
										<div class="down-btn">
											<input type="text" class="form-control" name="start_time" id="start_time" placeholder="검색할 기간의 시작일" autocomplete="off" value="">
										</div>
									</li>
									<li class="rev-list">
										<div class="down-btn">
											<input type="text" class="form-control" name="end_time" id="end_time" placeholder="검색할 기간의 종료일" autocomplete="off" value="">
										</div>
									</li>
																		<li class="rev-list">
										<div class="down-btn">
											<select class="form-control" name="review_level" id="review_level" onclick="event.cancelBubble=true;" autocomplete="off">
												<option value="">구매평 등급</option>
												<option value="best">베스트 구매평</option>
												<option value="worst">워스트 구매평</option>
											</select>
										</div>
									</li>
									<li class="rev-list">
										<input type="text" name="review_nick" id="review_nick" class="form-control" placeholder="작성자명" autocomplete="off" value="">
									</li>
									<li class="rev-list">
										<input type="text" name="review_prod_name" id="review_prod_name" class="form-control" placeholder="상품명" autocomplete="off" value="">
									</li>
									<li class="rev-list">
										<input type="text" name="brand" id="brand" class="form-control" placeholder="브랜드" autocomplete="off" value="">
									</li>
									<div class="height-1"></div>
									<div style="text-align:right;">
										<a href="javascript:;" class="btn-default" onclick="SHOP_REVIEW_MANAGE.reviewFilterReset(); return false;">초기화</a>
										<a href="javascript:;" class="btn-primary" onclick="SHOP_REVIEW_MANAGE.reviewSearchByFilter('search'); return false;">검색</a>
									</div>
								</form>
							</ul>
						</div>
						<div class="card no-margin">
							<div class="card-body no-padding">
								<form role="search" class="user-search" onsubmit="return false;">
									<div class="form-group">
									<span class="twitter-typeahead" style="position: relative; display: inline-block;">
										<input type="text" id="keyword" class="form-control typeahead tt-input" value="" placeholder="내용 검색" autocomplete="off" spellcheck="false" dir="auto" onkeydown="if (event.keyCode==13) SHOP_REVIEW_MANAGE.reviewSearchByFilter('search', '', 'keyword_input');">
									</span>
										<label class="icon_set" style="right: 18px; cursor: pointer" onclick="SHOP_REVIEW_MANAGE.reviewSearchByFilter('search', '', 'keyword_input');">
											<i class="btl bt-search "></i>
										</label>
									</div>
								</form>
							</div>
						</div>
					</div>
										<div class="card-head prod-excel-form">
						<header class="small comments-header" style="padding-left: 0;">
							<div class="checkbox-inline checkbox-styled">
								<label class="no-margin">
																		<input type="checkbox" class="_chk _all_check" onclick="CONTENTS_LIST.allCheckToggle()" value="">
																		<span>구매평										<span class="text-primary" id="review_total_count">0</span></span>
								</label>
							</div>
						</header>
						<div class="list-view-size hidden-xs hidden-sm" style="margin-left: 460px">
						</div>
						<div class="excel-button">
															<a href="javascript:;" onclick="EXCEL_MANAGER.openExcelDownloadPopup('review', {'q': ''})" class="margin-right-xxl">
									<i class="simple icon-cloud-download text-16"></i>내보내기								</a>
														<select name="pagesize" id="pagesize" onchange="SHOP_REVIEW_MANAGE.reviewSearchByFilter('search')" class="form-control text-13">
								<option value="" selected="">5개씩 보기</option>
								<option value="10">10개씩 보기</option>
								<option value="20">20개씩 보기</option>
								<option value="50">50개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>

						</div>
					</div>
											<div id="review_list">
							<div class="card-body no-padding _content_body">
								<div class="text-center text-gray">
									<h4>표시할 데이터가 없습니다.</h4>
								</div>
							</div>
						</div>
									</div>
				<div class="col-md-3 hidden-xs hidden-sm">
					<div class="card style-default-light">
						<div class="card-head">
							<header>구매평 설정</header>
						</div>
						<div class="card-body no-padding-top">
														<div class="checkbox checkbox-styled">
								<label class="no-margin">
									<input type="checkbox" class="review_config_opt" id="shop_review_manager_one_page">
									<span>구매평/QnA 관리 펼쳐보기										<a href="javascript:;" class="text-gray" role="button" data-toggle="popover" data-html="true" data-placement="auto" title="" data-content="<p>이 기능을 사용하면 구매평 관리페이지의 내용과 댓글이 모두 펼쳐진 형태로 변경됩니다.</p>" data-original-title="구매평 관리 펼쳐보기"><i class="btm bt-question-circle"></i></a></span>
								</label>
							</div>
							<div class="checkbox checkbox-styled">
								<label class="no-margin">
									<input type="checkbox" class="review_config_opt" id="shop_review_level_order">
									<span>베스트/워스트 구매평 순서 조정										<a href="javascript:;" class="text-gray" role="button" data-toggle="popover" data-html="true" data-placement="auto" title="" data-content="<p>이 옵션을 사용하면 베스트 구매평은 상품 상세 구매평 목록 중 상위에 노출되며, 워스트 구매평은 하위에 노출됩니다.</p><p>주의: 판매자에게 유리하도록 구매평 순서를 조정할 경우 소비자의 기만적 유인행위에 해당되어 공정거래위원회의 시정명령 및 과태료 추징 대상이 될 수 있습니다.</p>" data-original-title="베스트/워스트 구매평 순서 조정"><i class="btm bt-question-circle"></i></a></span>
								</label>
							</div>
						</div>
						<div class="card-body no-padding-y">
							<div class="card-body no-padding-top" style="padding-left: 0px;">
								<div class="checkbox-inline checkbox-styled" style="margin-bottom: 8px;">
									<label class="no-margin">
										<span>구매평 작성 시 안내									</span></label>
								</div>
								<div class="form-group">
									<a href="#" data-toggle="modal" class="btn btn-xs btn-default-bright btn-sm-padding btn-circle" onclick="SHOP_REVIEW_MANAGE.openReviewPlaceHolderText();" style=" border-radius: 20px;">문구 설정</a>
								</div>
								<div class="card-body no-padding-y no-padding-x">
									<p>어떤 점이 좋으셨나요?									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="card style-default-light">
						<div class="card-head">
							<header>구매평 리마인더</header>
						</div>
						<div class="card-body no-padding-top">
							<div class="checkbox-inline checkbox-styled" style="margin-bottom: 8px;">
								<label class="no-margin">
									<input type="checkbox" class="review_config_opt" id="shop_review_remind_check">
									<span>배송완료 후 재접속 시 구매평 유도 팝업 알림										<a href="javascript:;" class="text-gray" role="button" data-toggle="popover" data-html="true" data-placement="auto" title="" data-content="<p>구매자가 사이트에 재방문하면 구매평 작성을 유도할 수 있게끔 팝업 알림이 나타나는 기능입니다.</p><p>설정 버튼을 눌러 팝업에 표시될 안내 문구를 입력할 수 있습니다.</p>" data-original-title="배송완료 후 재접속 시 구매평 유도 팝업 알림"><i class="btm bt-question-circle"></i></a></span>
								</label>
							</div>
							<div style="padding-left: 30px;" class="form-group">
								<a href="#" data-toggle="modal" class="btn btn-xs btn-default-bright btn-sm-padding btn-circle" onclick="SHOP_REVIEW_MANAGE.openReviewRemindText();" style=" border-radius: 20px;">문구 설정</a>
							</div>
							<div class="card-body no-padding-y" style="padding-left: 30px;">
								<p></p>
							</div>
							<!--							<textarea class="form-control" id="shop_review_remind_text" placeholder="팝업내 안내문구 입력 (예: 상품에 대한 리부 부탁드립니다. 후기를 남겨주시면 100포인트를 지급해 드립니다.)" style="height: 100px; width: 180px margin-bottom: 8px;">--><!--</textarea>-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!--섹션 끝 -->
</div><!--end #content-->
<!-- END CONTENT -->
<script>
	var EXCEL_MANAGER = new EXCEL_DOWNLOAD_MANAGER();

	$(function(){

		SHOP_REVIEW_MANAGE.init();
		CONTENTS_LIST.init($('#contents_list_wrap'));
		$('#start_time').datetimepicker({
			dayViewHeaderFormat : 'YYYY MMMM',
			locale : SITE_COUNTRY_CODE === TAIWAN_COUNTRY_CODE ? 'zh_tw' : 'ko',
			icons : {
				time : 'zmdi zmdi-time',
				date : 'zmdi zmdi-calendar',
				up : 'zmdi zmdi-chevron-up',
				down : 'zmdi zmdi-chevron-down',
				previous : 'zmdi zmdi-chevron-left',
				next : 'zmdi zmdi-chevron-right',
				today : 'glyphicon glyphicon-screenshot',
				clear : 'glyphicon glyphicon-trash'
			},
			format : 'YYYY-MM-DD',
		}).on('blur', function(data){
			if($('#start_time').val() > $('#end_time').val()){
				$('#end_time').val($('#start_time').val());
			}
		});
		$('#end_time').datetimepicker({
			dayViewHeaderFormat : 'YYYY MMMM',
			locale : SITE_COUNTRY_CODE === TAIWAN_COUNTRY_CODE ? 'zh_tw' : 'ko',
			icons : {
				time : 'zmdi zmdi-time',
				date : 'zmdi zmdi-calendar',
				up : 'zmdi zmdi-chevron-up',
				down : 'zmdi zmdi-chevron-down',
				previous : 'zmdi zmdi-chevron-left',
				next : 'zmdi zmdi-chevron-right',
				today : 'glyphicon glyphicon-screenshot',
				clear : 'glyphicon glyphicon-trash'
			},
			format : 'YYYY-MM-DD',
		}).on('blur', function(data){
			if($('#start_time').val() > $('#end_time').val()){
				$('#end_time').val($('#start_time').val());
			}
		});
	});
</script>
<style>
	#review_filter_list_chosen .chosen-drop {
		display : none;
	}

	.rev-filter .dropdown-menu {
		min-width : 250px;
	}

	.rev-list {
		line-height   : 40px;
		border-bottom : 1px solid #ddd;
		margin-bottom : 10px;
		position      : relative;
	}

	.rev-filter .btn-default {
		border        : 1px solid #ccc;
		padding       : 9px 16px;
		color         : #333;
		line-height   : 34px;
		border-radius : 3px;
		background    : #fff;
		margin-right  : 5px;
		divplay       : inline-block;
	}

	.rev-filter .btn-primary {
		border        : 1px solid #00b0f5;
		padding       : 9px 16px;
		color         : #fff;
		line-height   : 34px;
		border-radius : 3px;
		divplay       : inline-block;
	}

	.rev-list .form-control {
		background : transparent;
		border     : none;
		padding    : 0;
		height     : 40px;
	}

	.rev-list .down-btn:after {
		display                 : inline-block;
		font                    : normal normal normal 14px/1 'Material-Design-Iconic-Font';
		text-rendering          : auto;
		-webkit-font-smoothing  : antialiased;
		-moz-osx-font-smoothing : grayscale;
		content                 : '\f2f2';
		position                : absolute;
		right                   : -0px;
		top                     : 50%;
		margin-top              : -11.5px;
		font-size               : 23px;
		opacity                 : 0.5;
	}

	.rev-filter-btn {
		text-align : left;
		border     : none;
	}

	.rev-filter-btn .caret {
		position   : absolute;
		right      : 15px;
		top        : 50%;
		margin-top : -2px;
		opacity    : 0.5;
	}

	.rev-list input {
		padding : 0;
		border  : none;
		height  : 40px;
	}

	.prod-excel-form .form-control {
		height  : auto;
		display : inline-block;
		border  : none;
		width   : auto;
	}
</style>
<script>
	$(function(){//리뷰 리뉴얼 전까지 리뷰 이미지 라이트박스 처리
		$('.one_page_review_body').find('img').each(function(){
			if($(this).parent().get(0).tagName == 'A')
				return true;
			$(this).attr('data-src', $(this).attr('src')).data('src', $(this).attr('src')).addClass('_img_light_gallery cursor_pointer');
		});
		$('.one_page_review_body').lightGallery({
			selector : '._img_light_gallery',
			thumbnail : false,
			animateThumb : false,
			showThumbByDefault : false,
			hash : false,
			speed : 200
		});
	});
</script>
<script>
	$(function(){//리뷰 리뉴얼 전까지 리뷰 이미지 라이트박스 처리
		$('.feed-summary').find('img').each(function(){
			if($(this).parent().get(0).tagName == 'A')
				return true;
			$(this).attr('data-src', $(this).attr('src')).data('src', $(this).attr('src')).addClass('_img_light_gallery cursor_pointer');
		});
		$('.feed-summary').lightGallery({
			selector : '._img_light_gallery',
			thumbnail : false,
			animateThumb : false,
			showThumbByDefault : false,
			hash : false,
			speed : 200
		});
	});
</script><script>	
			$(window).on("keyup", function(e){
				if ( $.cocoaDialog.isOpen() ) {
					$.cocoaDialog.modalControl(e);
				}
				return false;
			});</script>
<!-- BEGIN MENUBAR-->
<button type="button" class="hidden-lg hidden-md toggle-btn" data-dismiss="menubar">
	<span class="sr-only">Toggle navigation</span>
	<i class="btl bt-times"></i>
</button>

<div id="menubar" class="animate">
	<div class="nano has-scrollbar" style="height: 921px;"><div class="nano-content" tabindex="0" style="right: -17px;"><div class="menubar-scroll-panel" style="padding-bottom: 50px;">
		<div class="tabled full-width">
			<a href="javascript:" class="holder global_icon_menu dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
				<div style="position: absolute; left: 22px; top: 0; line-height: 36px;">
					<img src="/common/img/flag_shapes/flag_kr_circle.png" width="20" height="20">
				</div>
				<div class="brand-holder">
					<span class="title_controls">dusgml</span>
				</div>
			</a>
			<ul class="dropdown-menu global_setting animation-dock menu-card-styling">					<li class="holder ">
						<a href="/admin/shopping/review">
							<div class="tabled">
								<div class="table-cell vertical-middle width-1">
									<img width="30" height="30" src="/common/img/flag_shapes/flag_kr_circle.png">
								</div>
								<div class="table-cell vertical-middle domain">
									<div class="inline-blocked">
										<span class="domain_name">dusgml</span>
									</div>
									<span data-original-title="일반 방문자의 접속이 제한됩니다. 글로벌 버전으로 업그레이드 해주세요" data-toggle="tooltip" class="badge" data-placement="top" style="margin-left: 5px; vertical-align: top;">미결제</span>
																			<div class="text-gray-bright text-12">yeonhee0623.imweb.me</div>
																	</div>
							</div>
						</a>
						<div class="tools">
													</div>
					</li>
					<li class="border-top"><a href="javascript:;" onclick="SITE_MANAGE.openAddUnit('S20230724b38d1d4688d7b')" class="text-primary" style="padding-top: 15px;">새 언어 사이트 추가</a></li></ul>		</div>
		<ul id="main-menu" class="gui-controls"><li class="  " data-title="design_mode"><a href="/admin/design"><div class="gui-icon"><i class="db-wand"></i></div><span class="title title_controls">디자인모드</span></a></li><li class="  " data-title="preview"><a href="//yeonhee0623.imweb.me" target="_blank"><div class="gui-icon"><i class="db-preview"></i></div><span class="title title_controls">사이트 바로가기</span></a></li><li class="spacer"></li><li class="top-menu"><a href="javascript:;" onclick="DASHBOARD.openSiteManagementDialog(this);"><span>사이트 관리</span><i class="btm bt-plus-circle"></i></a></li><li class="  " data-title="dashboard"><a href="/admin//"><div class="gui-icon"><i class="db-dashboard"></i></div><span class="title title_controls">대시보드</span></a></li><li class=" gui-folder " data-title="member"><a href="/admin/member" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-user"></i></div><span class="title title_controls">사용자 관리</span></a><ul><li class="  " data-title="member_list"><a href="/admin/member/list"><span class="title title_controls">사용자 목록</span></a></li><li class="  " data-title="member_msg"><a href="/admin/member/send"><span class="title title_controls">메세지 보내기</span></a></li><li class="  " data-title="member_permission"><a href="/admin/member/permission"><span class="title title_controls">운영진 설정</span></a></li><li class="  " data-title="member_mail"><a href="/admin/member/mail"><span class="title title_controls">메일 발송 설정</span></a></li><li class="  " data-title="member_sms"><a href="/admin/member/sms"><span class="title title_controls">SMS/알림톡 설정</span></a></li></ul></li><li class="  " data-title="crm"><a href="/admin/crm_marketing"><div class="gui-icon"><i class="db-crm"></i></div><span class="title title_controls">고객 행동 관리</span><span class="badge_icon badge_beta">Beta</span></a></li><li class="active gui-folder expanded" data-title="shopping"><a href="/admin/shopping" class="sidebar-nav-menu1" onclick="return false;"><div class="gui-icon"><i class="db-shopping-bag"></i></div><span class="title title_controls">쇼핑</span></a><ul><li class="  " data-title="shopping_product"><a href="/admin/shopping/product"><span class="title title_controls">상품관리</span></a></li><li class="  " data-title="shopping_interlocking"><a href="/admin/shopping/interlocking"><span class="title title_controls">연동 상품관리</span><span class="badge_icon badge_beta">Beta</span></a></li><li class="  " data-title="shopping_order"><a href="/admin/shopping/order"><span class="title title_controls">주문관리</span></a></li><li class="  " data-title="shopping_cancel"><a href="/admin/shopping/cancel"><span class="title title_controls">취소관리</span></a></li><li class="  " data-title="shopping_return"><a href="/admin/shopping/return"><span class="title title_controls">반품관리</span></a></li><li class="  " data-title="shopping_exchange"><a href="/admin/shopping/exchange"><span class="title title_controls">교환관리</span></a></li><li class="  " data-title="shopping_regularly"><a href="/admin/shopping/regularly"><span class="title title_controls">정기구독 관리</span></a></li><li class="active expanded" data-title="shopping_review"><a href="/admin/shopping/review" class=" active"><span class="title title_controls">구매평 관리</span></a></li><li class="  " data-title="shopping_answers"><a href="/admin/shopping/answers"><span class="title title_controls">문의관리</span></a></li><li class="  " data-title="member_mileage"><a href="/admin/shopping/mileage"><span class="title title_controls">적립금 관리</span></a></li><li class="  " data-title="shopping_coupon"><a href="/admin/shopping/coupon"><span class="title title_controls">쿠폰</span></a></li><li class="  " data-title="shopping_shipping"><a href="/admin/shopping/shipping"><span class="title title_controls">배송관리</span></a></li><li class="  " data-title="shopping_config"><a href="/admin/shopping/config"><span class="title title_controls">쇼핑 환경설정</span></a></li></ul></li><li class=" gui-folder " data-title="booking"><a href="/admin/booking" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-calendar"></i></div><span class="title title_controls">예약</span></a><ul><li class="  " data-title="booking_product"><a href="/admin/booking/product"><span class="title title_controls">객실/사이트 관리</span></a></li><li class="  " data-title="booking_order_cal"><a href="/admin/booking/order_cal"><span class="title title_controls">예약 현황 관리</span></a></li><li class="  " data-title="booking_order"><a href="/admin/booking/order"><span class="title title_controls">예약 신청 관리</span></a></li><li class="  " data-title="booking_review"><a href="/admin/booking/review"><span class="title title_controls">후기 관리</span></a></li><li class="  " data-title="booking_answers"><a href="/admin/booking/answers"><span class="title title_controls">문의관리</span></a></li><li class="  " data-title="booking_option"><a href="/admin/booking/option"><span class="title title_controls">옵션 관리</span></a></li><li class="  " data-title="booking_season"><a href="/admin/booking/season"><span class="title title_controls">성수기/휴일 관리</span></a></li><li class="  " data-title="booking_config"><a href="/admin/booking/config"><span class="title title_controls">예약 설정</span></a></li></ul></li><li class=" gui-folder " data-title="contents"><a href="/admin/contents" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-pencil"></i></div><span class="title title_controls">컨텐츠 관리</span></a><ul><li class="  " data-title="contents_post"><a href="/admin/contents/post"><span class="title title_controls">게시물 관리</span></a></li><li class="  " data-title="contents_comment"><a href="/admin/contents/comment"><span class="title title_controls">댓글 관리</span></a></li><li class="  " data-title="contents_form"><a href="/admin/contents/form"><span class="title title_controls">입력폼 관리</span></a></li><li class="  " data-title="contents_map"><a href="/admin/contents/map"><span class="title title_controls">지도 관리</span></a></li><li class="  " data-title="contents_calendar"><a href="/admin/contents/calendar"><span class="title title_controls">일정 관리</span></a></li><li class="  " data-title="contents_gallery"><a href="/admin/contents/gallery"><span class="title title_controls">갤러리 관리</span></a></li><li class="  " data-title="contents_report"><a href="/admin/contents/report"><span class="title title_controls">신고/차단 관리</span></a></li></ul></li><li class=" gui-folder " data-title="marketing"><a href="/admin/marketing" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-megaphone"></i></div><span class="title title_controls">광고 캠페인 관리</span><span class="badge_icon badge_beta">Beta</span></a><ul><li class="  " data-title="marketing_home"><a href="/admin/marketing/marketing-home"><span class="title title_controls">홈</span></a></li><li class="  " data-title="marketing_dashboard"><a href="/admin/marketing/dashboard"><span class="title title_controls">대시보드</span></a></li><li class="  " data-title="marketing_campaign"><a href="/admin/marketing/campaign"><span class="title title_controls">캠페인</span></a></li><li class="  " data-title="marketing_credit"><a href="/admin/marketing/credit"><span class="title title_controls">크레딧 관리</span></a></li><li class="  " data-title="marketing_dataconnect"><a href="/admin/marketing/data-connect"><span class="title title_controls">데이터 연결</span></a></li></ul></li><li class=" gui-folder " data-title="app"><a href="/admin/app" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-mobile"></i></div><span class="title title_controls">App 신청 및 관리</span></a><ul><li class="  " data-title="app_android"><a href="/admin/app/android"><span class="title title_controls">Android 앱</span></a></li><li class="  " data-title="app_ios"><a href="/admin/app/ios"><span class="title title_controls">iOS 앱</span></a></li></ul></li><li class=" gui-folder " data-title="stat"><a href="/admin/stat" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-status-up"></i></div><span class="title title_controls">통계</span></a><ul><li class="  " data-title="stat_summary"><a href="/admin/stat/summary"><span class="title title_controls">개요</span></a></li><li class="  " data-title="stat_analytics"><a href="/admin/stat/analytics"><span class="title title_controls">기간별 분석</span></a></li><li class="  " data-title="admin_stat_mileage"><a href="/admin/stat/mileage"><span class="title title_controls">적립금 통계</span></a></li><li class="  " data-title="stat_shopping"><a href="/admin/stat/shopping"><span class="title title_controls">매출</span><span class="badge_icon badge_beta">Beta</span></a></li><li class="  " data-title="stat_feedback"><a href="/admin/stat/feedback"><span class="title title_controls">컨텐츠 반응</span></a></li><li class="  " data-title="stat_visitor"><a href="/admin/stat/visitor"><span class="title title_controls">방문자 통계</span></a></li><li class="  " data-title="stat_site"><a href="/admin/stat/site"><span class="title title_controls">유입 사이트</span></a></li><li class="  " data-title="stat_keyword"><a href="/admin/stat/keyword"><span class="title title_controls">유입 검색어</span></a></li><li class="  " data-title="stat_page"><a href="/admin/stat/page"><span class="title title_controls">많이 방문한 페이지</span></a></li><li class="  " data-title="stat_storage"><a href="/admin/stat/storage"><span class="title title_controls">저장공간</span></a></li><li class="  " data-title="stat_traffic"><a href="/admin/stat/traffic"><span class="title title_controls">트래픽</span></a></li><li class="  " data-title="stat_laplace_analytics"><a href="/admin/stat/laplace_analytics"><span class="title title_controls">라플라스 애널리틱스</span></a></li><li class="  " data-title="marketing_acecounter"><a href="/admin/stat/ace_counter"><span class="title title_controls">에이스카운터</span></a></li></ul></li><li class="  " data-title="payment"><a href="/admin/payment"><div class="gui-icon"><i class="icon-rocket"></i></div><span class="title title_controls">결제/앱스토어</span></a></li><li class=" gui-folder " data-title="config"><a href="/admin/config" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-settings"></i></div><span class="title title_controls">환경설정</span></a><ul><li class="  " data-title="config_default"><a href="/admin/config/default"><span class="title title_controls">기본 설정</span></a></li><li class="  " data-title="config_localize"><a href="/admin/config/localize"><span class="title title_controls">언어/지역/통화</span></a></li><li class="  " data-title="config_pg"><a href="/admin/config/pg"><span class="title title_controls">전자결제(PG) 설정</span></a></li><li class="  " data-title="config_domain"><a href="/admin/config/domain"><span class="title title_controls">도메인 구입 및 설정</span></a></li><li class="  " data-title="config_ssl"><a href="/admin/config/ssl"><span class="title title_controls">SSL(보안서버) 구입 및 설정</span></a></li><li class="  " data-title="config_security"><a href="/admin/config/security"><span class="title title_controls">보안 및 개인정보 보호</span></a></li><li class="  " data-title="config_membership"><a href="/admin/config/membership"><span class="title title_controls">가입 및 그룹 설정</span></a></li><li class="  " data-title="config_seo"><a href="/admin/config/seo"><span class="title title_controls">SEO, 헤더설정</span></a></li><li class="  " data-title="config_etc"><a href="/admin/config/etc"><span class="title title_controls">약관 설정</span></a></li><li class="  " data-title="config_popup"><a href="/admin/config/popup"><span class="title title_controls">팝업/배너 관리</span></a></li><li class="  " data-title="config_adult"><a href="/admin/config/adult"><span class="title title_controls">본인인증/성인인증</span></a></li><li class="  " data-title="config_oauth"><a href="/admin/config/oauth"><span class="title title_controls">소셜 로그인 / API 설정</span></a></li><li class="  " data-title="config_chat"><a href="/admin/config/chat"><span class="title title_controls">실시간 상담 설정</span></a></li><li class="  " data-title="config_find_designer"><a href="/admin/config/find_designer"><span class="title title_controls">디자이너/리셀러 찾기</span></a></li><li class="  " data-title="config_api_v2"><a href="/admin/config/rest_v2"><span class="title title_controls">외부 서비스 연동 (API)</span></a></li></ul></li><li class="spacer"></li><li class="top-menu"><div><span>리소스</span></div></li><li class="  " data-title="support"><a href="//imweb.me/customer" target="_blank"><div class="gui-icon"><i class="db-comments"></i></div><span class="title title_controls">고객지원</span></a></li><li class=" gui-folder " data-title="campus"><a href="edu" class="sidebar-nav-menu" onclick="return false;"><div class="gui-icon"><i class="db-graduation-cap"></i></div><span class="title title_controls">아임웹 교육</span></a><ul><li class="  " data-title="campus_edu"><a href="https://imweb.me/edu" target="_blank"><span class="title title_controls">교육 일정/신청</span></a></li><li class="  " data-title="campus_video"><a href="https://imweb.me/video_lecture" target="_blank"><span class="title title_controls">동영상 강의</span></a></li></ul></li><li class="  " data-title="consulting_design"><a href="https://imweb.me/find_designer" target="_blank"><div class="gui-icon"><i class="db-glasses"></i></div><span class="title title_controls">디자이너 찾기</span></a></li></ul>		<div class="height-1"></div>
		<div class="menubar-foot-panel">
			<div class="full-height">
								<a href="javascript:" class="dropdown-toggle block _lang_button" data-toggle="dropdown" tabindex="-1" aria-expanded="false">
					<i class="icon-globe"></i>
					<span class="panel-text">한국어</span>
				</a>
				<ul class="dropdown-menu pull-right">
					<li><a href="javascript:;" onclick="ADMIN.changeAdminLang('KR')" data-language="KR">한국어</a></li><li><a href="javascript:;" onclick="ADMIN.changeAdminLang('EN')" data-language="EN">English (Beta)</a></li><li><a href="javascript:;" onclick="ADMIN.changeAdminLang('zh-TW')" data-language="zh-TW">中文 (繁體)</a></li>				</ul>
			</div>
		</div>
	</div></div><div class="nano-pane"><div class="nano-slider" style="height: 637px; top: 0px;"></div></div></div>
</div>
<div class="fold_area tabled animate" style="padding-left: 24px;">
	<div class="table-cell vertical-middle" style="padding-right: 45px;">
		<a href="/admin/" class="logo_icon_menu">
			<img src="/common/img/imweb_new_logo_white2.png?v2">		</a>
	</div>
	<a class="_tooltip_btn side_bar_btn" href="javascript:void(0)" role="button" id="toggle_button">
		<span class="fold_button left" data-original-title="사이드바 접어두기" data-toggle="tooltip" data-placement="bottom">
			<i class="icons fa fa-chevron-left" style="opacity: 0.6"></i>
			<i class="icons fa fa-chevron-left"></i>
		</span>
		<span class="fold_button right" data-original-title="사이드바 펼쳐두기" data-toggle="tooltip" data-placement="bottom">
			<i class="icons fa fa-chevron-right"></i>
			<i class="icons fa fa-chevron-right" style="opacity: 0.6"></i>
		</span>
	</a>
</div>

<script>
  (function(){
    let body = document.body;
    let btn = document.querySelector('#toggle_button');
    let sidebar_mini_class = 'sidebar-mini';
    let user_sm_status = getCookie('sm_status');
    let window_width = window.innerWidth;
    setPrimarySideMenu();

    btn.addEventListener('click', handleToggleButton);
    btn.addEventListener('touch', handleToggleButton);

    //만약 사용자가 버튼을 누르지 않았을때만 이 이벤트 리스너를 사용할것임.
      window.onresize = () => {
        window_width = window.innerWidth;
        if(user_sm_status !== 'h'&& user_sm_status !== 's') {
          resizeWindow(window_width)
        }
      }

    function handleToggleButton(){
      if (user_sm_status == 'h') {
        setSideMenu('show');
      } else {
        setSideMenu('hide');
      }
    }

    function resizeWindow(window_width){
      if (window_width > 1280 || window_width < 991) {
        body.classList.remove(sidebar_mini_class);
      }
      //992~1279 일때
     else {
        body.classList.add(sidebar_mini_class)
      }
    }

    function setPrimarySideMenu() {
      if( window_width > 1280 && user_sm_status !== 'h'|| window_width < 991 ) {
        body.classList.remove(sidebar_mini_class);
      }
      //992~1279 일때
      else if( window_width <=1280 && window_width >= 991) {
          if(user_sm_status == 's') body.classList.remove(sidebar_mini_class);
          else body.classList.add(sidebar_mini_class)
      }
      else{
        body.classList.add(sidebar_mini_class)
      }
    }

    function setSideMenu(show){
      if(show == "show") {
        setCookie('sm_status', 's',1);
        body.classList.remove(sidebar_mini_class);
        user_sm_status = 's'
      }
      else{
        setCookie('sm_status','h',1);
        body.classList.add(sidebar_mini_class);
        user_sm_status = 'h';
      }
    }
  })()

</script>
</div> <!-- END BASE -->

<script>
</script><div style="position: absolute; width: 1px; height: 1px; left: -10000px;" data-ip="220.117.144.98" data-ip2="" data-ip3="220.117.144.98, 130.176.126.94"><input id="dummy_input" type="text"></div>

<div class="modal" id="cocoaModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal submodal" role="dialog" id="cocoaSubModal" style="z-index: 17001">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<iframe name="hidden_frame" id="hidden_frame" style="position: absolute; left: -9999px; width: 1px; height: 1px; top:-9999px;"></iframe>

<!-- Channel Script -->
<script type="text/javascript">
window.channelPluginSettings = {"pluginKey":"6a8aaaf7-8e2f-400b-9946-491b9354592f","language":"ko","zIndex":1000,"memberId":"M20230724bf273e96df77e","profile":{"name":"\uc870\uc5f0\ud76c","mobileNumber":"01076448508","email":"fhzp8507@gmail.com","joinTime":"2023-07-24 10:03:20","avatarUrl":"https:\/\/cdn.imweb.me\/thumbnail\/20230724\/7e76bd54170f9.png","memberType":"Free","educationApplication":"N","visitsCount":9,"usingConsulting":"","siteVersion":"Free","isSiteExpired":"N","makeDate_dcv1":"2023-07-24 10:03:22","makeDate":"2023-07-24 10:03:22","expireDate":null,"siteMemberCount_dcv1":1,"siteMemberCount":1,"mainDomain":"yeonhee0623.imweb.me","imwebDomain":"yeonhee0623.imweb.me","useSSL":"","usingTrace":"N","pgName":"\ubbf8\uac00\uc785","usingNpay":false,"npayVersion":2,"totalSalePrice":0,"lastMonthSalePrice":0}};
(function() {
	var w = window;
	if (w.ChannelIO) {
		return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	}
	var d = window.document;
	var ch = function() {
		ch.c(arguments);
	};
	ch.q = [];
	ch.c = function(args) {
		ch.q.push(args);
	};
	w.ChannelIO = ch;
	function l() {
		if (w.ChannelIOInitialized) {
			return;
		}
		w.ChannelIOInitialized = true;
		var s = document.createElement('script');
		s.style.zIndex = 1100; 
		s.type = 'text/javascript';
		s.async = true;
		s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		s.charset = 'UTF-8';
		var x = document.getElementsByTagName('script')[0];
		x.parentNode.insertBefore(s, x);
	}
	if (document.readyState === 'complete') {
		l();
	} else if (window.attachEvent) {
		window.attachEvent('onload', l);
	} else {
	window.addEventListener('DOMContentLoaded', l, false);
	window.addEventListener('load', l, false);
	}
})();
</script>



<script>
	</script>

<script type="text/javascript">
    mixpanel.init('a4939111ea54962dbf95fe89a992eab3', {debug: false});
    mixpanel.identify('m202307244c9d6d5a3497a');
    MIXPANEL.init();
</script>

<div id="device-breakpoints"><div class="device-xs visible-xs" data-breakpoint="xs"></div><div class="device-sm visible-sm" data-breakpoint="sm"></div><div class="device-md visible-md" data-breakpoint="md"></div><div class="device-lg visible-lg" data-breakpoint="lg"></div></div><div id="ch-plugin" class="notranslate" style="z-index: 1000 !important;">      <div id="ch-plugin-entry"><div style="display: block !important;"></div></div>      <div id="ch-plugin-script" style="display:none;" class="ch-messenger-hidden">        <iframe id="ch-plugin-script-iframe" title="Channel chat" style="position:relative!important;height:100%!important;width:100%!important;border:none!important;"></iframe>      </div>    <style data-styled="active" data-styled-version="5.3.9"></style></div></body></html>