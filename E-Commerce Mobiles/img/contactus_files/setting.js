/* Sticky */
(function($){var defaults={topSpacing:0,bottomSpacing:0,className:'is-sticky',wrapperClassName:'sticky-wrapper',center:false,getWidthFrom:''},$window=$(window),$document=$(document),sticked=[],windowHeight=$window.height(),scroller=function(){var scrollTop=$window.scrollTop(),documentHeight=$document.height(),dwh=documentHeight-windowHeight,extra=(scrollTop>dwh)?dwh-scrollTop:0;for(var i=0;i<sticked.length;i++){var s=sticked[i],elementTop=s.stickyWrapper.offset().top,etse=elementTop-s.topSpacing-extra;if(scrollTop<=etse){if(s.currentTop!==null){s.stickyElement.css('position','').css('top','');s.stickyElement.parent().removeClass(s.className);s.currentTop=null}}else{var newTop=documentHeight-s.stickyElement.outerHeight()-s.topSpacing-s.bottomSpacing-scrollTop-extra;if(newTop<0){newTop=newTop+s.topSpacing}else{newTop=s.topSpacing}if(s.currentTop!=newTop){s.stickyElement.css('position','fixed').css('top',newTop);if(typeof s.getWidthFrom!=='undefined'){s.stickyElement.css('width',$(s.getWidthFrom).width())}s.stickyElement.parent().addClass(s.className);s.currentTop=newTop}}}},resizer=function(){windowHeight=$window.height()},methods={init:function(options){var o=$.extend(defaults,options);return this.each(function(){var stickyElement=$(this);var stickyId=stickyElement.attr('id');var wrapper=$('<div></div>').attr('id',stickyId+'-sticky-wrapper').addClass(o.wrapperClassName);stickyElement.wrapAll(wrapper);if(o.center){stickyElement.parent().css({width:stickyElement.outerWidth(),marginLeft:"auto",marginRight:"auto"})}if(stickyElement.css("float")=="right"){stickyElement.css({"float":"none"}).parent().css({"float":"right"})}var stickyWrapper=stickyElement.parent();stickyWrapper.css('height',stickyElement.outerHeight());sticked.push({topSpacing:o.topSpacing,bottomSpacing:o.bottomSpacing,stickyElement:stickyElement,currentTop:null,stickyWrapper:stickyWrapper,className:o.className,getWidthFrom:o.getWidthFrom})})},update:scroller};if(window.addEventListener){window.addEventListener('scroll',scroller,false);window.addEventListener('resize',resizer,false)}else if(window.attachEvent){window.attachEvent('onscroll',scroller);window.attachEvent('onresize',resizer)}$.fn.sticky=function(method){if(methods[method]){return methods[method].apply(this,Array.prototype.slice.call(arguments,1))}else if(typeof method==='object'||!method){return methods.init.apply(this,arguments)}else{$.error('Method '+method+' does not exist on jQuery.sticky')}};$(function(){setTimeout(scroller,0)})})(jQuery);

/*! http://tinynav.viljamis.com v1.1 by @viljamis */
(function(a,i,g){a.fn.tinyNav=function(j){var b=a.extend({active:"selected",header:"",label:""},j);return this.each(function(){g++;var h=a(this),d="tinynav"+g,f=".l_"+d,e=a("<select/>").attr("id",d).addClass("tinynav "+d);if(h.is("ul,ol")){""!==b.header&&e.append(a("<option/>").text(b.header));var c="";h.addClass("l_"+d).find("a").each(function(){c+='<option value="'+a(this).attr("href")+'">';var b;for(b=0;b<a(this).parents("ul, ol").length-1;b++)c+="- ";c+=a(this).text()+"</option>"});e.append(c);
b.header||e.find(":eq("+a(f+" li").index(a(f+" li."+b.active))+")").attr("selected",!0);e.change(function(){i.location.href=a(this).val()});a(f).after(e);b.label&&e.before(a("<label/>").attr("for",d).addClass("tinynav_label "+d+"_label").append(b.label))}})}})(jQuery,this,0);

/* Bootstrap Dropdown and Tabber */
!function(a){function d(){a(".dropdown-backdrop").remove(),a(b).each(function(){e(a(this)).removeClass("open")})}function e(b){var c=b.attr("data-target"),d;c||(c=b.attr("href"),c=c&&/#/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,"")),d=c&&a(c);if(!d||!d.length)d=b.parent();return d}var b="[data-toggle=dropdown]",c=function(b){var c=a(b).on("click.dropdown.data-api",this.toggle);a("html").on("click.dropdown.data-api",function(){c.parent().removeClass("open")})};c.prototype={constructor:c,toggle:function(b){var c=a(this),f,g;if(c.is(".disabled, :disabled"))return;return f=e(c),g=f.hasClass("open"),d(),g||("ontouchstart"in document.documentElement&&a('<div class="dropdown-backdrop"/>').insertBefore(a(this)).on("click",d),f.toggleClass("open")),c.focus(),!1},keydown:function(c){var d,f,g,h,i,j;if(!/(38|40|27)/.test(c.keyCode))return;d=a(this),c.preventDefault(),c.stopPropagation();if(d.is(".disabled, :disabled"))return;h=e(d),i=h.hasClass("open");if(!i||i&&c.keyCode==27)return c.which==27&&h.find(b).focus(),d.click();f=a("[role=menu] li:not(.divider):visible a",h);if(!f.length)return;j=f.index(f.filter(":focus")),c.keyCode==38&&j>0&&j--,c.keyCode==40&&j<f.length-1&&j++,~j||(j=0),f.eq(j).focus()}};var f=a.fn.dropdown;a.fn.dropdown=function(b){return this.each(function(){var d=a(this),e=d.data("dropdown");e||d.data("dropdown",e=new c(this)),typeof b=="string"&&e[b].call(d)})},a.fn.dropdown.Constructor=c,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=f,this},a(document).on("click.dropdown.data-api",d).on("click.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.dropdown.data-api",b,c.prototype.toggle).on("keydown.dropdown.data-api",b+", [role=menu]",c.prototype.keydown)}(window.jQuery),!function(a){var b=function(b){this.element=a(b)};b.prototype={constructor:b,show:function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.attr("data-target"),e,f,g;d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,""));if(b.parent("li").hasClass("active"))return;e=c.find(".active:last a")[0],g=a.Event("show",{relatedTarget:e}),b.trigger(g);if(g.isDefaultPrevented())return;f=a(d),this.activate(b.parent("li"),c),this.activate(f,f.parent(),function(){b.trigger({type:"shown",relatedTarget:e})})},activate:function(b,c,d){function g(){e.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),b.addClass("active"),f?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu")&&b.closest("li.dropdown").addClass("active"),d&&d()}var e=c.find("> .active"),f=d&&a.support.transition&&e.hasClass("fade");f?e.one(a.support.transition.end,g):g(),e.removeClass("in")}};var c=a.fn.tab;a.fn.tab=function(c){return this.each(function(){var d=a(this),e=d.data("tab");e||d.data("tab",e=new b(this)),typeof c=="string"&&e[c]()})},a.fn.tab.Constructor=b,a.fn.tab.noConflict=function(){return a.fn.tab=c,this},a(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(b){b.preventDefault(),a(this).tab("show")})}(window.jQuery)

$('a[href=#wrap]').click(function(){$('html, body').animate({scrollTop:0}, 'slow'); return false;});
$('a[href=#leave]').click(function(){$('html, body').animate({scrollTop: $("#leave").offset().top}, 1000); return false;});
$(function () {$(".mcatlist").tinyNav({active: 'selected', header: 'All Categories'});});
$(function(){$(function () {$(window).scroll(function () {if ($(this).scrollTop() > 100) {$('.backtop').fadeIn();} else {$('.backtop').fadeOut();}});});});

/* Click to load Disqus */
$(document).ready(function() {
	$('.showDisqus').on('click', function(){
		var disqus_shortname = 'onextrapixel';

   		$.ajax({
	         type: "GET",
	         url: "http://" + disqus_shortname + ".disqus.com/embed.js",
	         dataType: "script",
	         cache: true
	     });
	     $(this).fadeOut(); 
	});
	/* Sticky Area */
	$("#tophead").sticky({topSpacing:0});
    $("#lastsideads").sticky({topSpacing:50});
});