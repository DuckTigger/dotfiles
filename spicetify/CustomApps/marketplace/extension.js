var marketplace=(()=>{var r=Object.defineProperty,s=Object.defineProperties,n=Object.getOwnPropertyDescriptors,o=Object.getOwnPropertySymbols,a=Object.prototype.hasOwnProperty,c=Object.prototype.propertyIsEnumerable,i=(e,t,s)=>t in e?r(e,t,{enumerable:!0,configurable:!0,writable:!0,value:s}):e[t]=s,l=(e,t)=>{for(var s in t=t||{})a.call(t,s)&&i(e,s,t[s]);if(o)for(var s of o(t))c.call(t,s)&&i(e,s,t[s]);return e},u=(e,t)=>s(e,n(t)),p="marketplace:installed-extensions",m="marketplace:installed-snippets",h="marketplace:theme-installed",d="marketplace:colorShift",g=100,f=(t,e)=>{t=localStorage.getItem(t);if(!t)return e;try{return JSON.parse(t)}catch(e){return t}},w=e=>{if(3===e.length)e=e.split("").map(e=>e+e).join("");else{if(6!=e.length)throw"Only 3- or 6-digit hex colours are allowed.";if(e.match(/[^0-9a-f]/i))throw"Only hex colours are allowed."}e=e.match(/.{1,2}/g);if(e&&3===e.length)return[parseInt(e[0],16),parseInt(e[1],16),parseInt(e[2],16)];throw"Could not parse hex colour."},y=(e,t)=>{let s=[];return e&&0<e.length?s=e:s.push({name:t,url:"https://github.com/"+t}),s},S=()=>{console.log("Resetting Marketplace"),Object.keys(localStorage).forEach(e=>{e.startsWith("marketplace:")&&(localStorage.removeItem(e),console.log("Removed "+e))}),console.log("Marketplace has been reset"),location.reload()},b=s=>{const e=document.querySelector("link[href='colors.css']"),t=(e&&e.remove(),document.querySelector("style.marketplaceCSS.marketplaceScheme"));if(t&&t.remove(),s){const r=document.createElement("style");r.classList.add("marketplaceCSS"),r.classList.add("marketplaceScheme");let t=":root {";const n=Object.keys(s);n.forEach(e=>{t=(t+=`--spice-${e}: #${s[e]};`)+`--spice-rgb-${e}: ${w(s[e])};`}),t+="}",r.innerHTML=t,document.head.appendChild(r)}else{const o=document.createElement("link");o.setAttribute("rel","stylesheet"),o.setAttribute("href","colors.css"),o.classList.add("userCSS"),document.head.appendChild(o)}},v=e=>{var t,e=e.match(new RegExp("https:\\/\\/raw\\.githubusercontent\\.com\\/(?<user>[^/]+)\\/(?<repo>[^/]+)\\/(?<branch>[^/]+)\\/(?<filePath>.+$)"));return{user:e?null==(t=null==e?void 0:e.groups)?void 0:t.user:null,repo:e?null==(t=null==e?void 0:e.groups)?void 0:t.repo:null,branch:e?null==(t=null==e?void 0:e.groups)?void 0:t.branch:null,filePath:e?null==(t=null==e?void 0:e.groups)?void 0:t.filePath:null}};function $(r,n){r&&null!=r&&r.forEach(e=>{n=n||r.user+"-"+r.repo;var t=window.sessionStorage.getItem(n);const s=t?JSON.parse(t):[];s.push(e),window.sessionStorage.setItem(n,JSON.stringify(s))})}async function k(e,t,s){var r=window.sessionStorage.getItem(e+"-"+t);const n=window.sessionStorage.getItem("noManifests");if(r)return JSON.parse(r);const o=`https://raw.githubusercontent.com/${e}/${t}/${s}/manifest.json`;if(null!=n&&n.includes(o))return null;r=await fetch(o).then(e=>e.json()).catch(()=>$([o],"noManifests"));return r&&window.sessionStorage.setItem(e+"-"+t,JSON.stringify(r)),r}async function L(e,t){var s=await async function(e,t=1){const s=window.sessionStorage.getItem("marketplace:blacklist");let r="https://api.github.com/search/repositories?per_page="+g;"extension"===e?r+="&q="+encodeURIComponent("topic:spicetify-extensions"):"theme"===e&&(r+="&q="+encodeURIComponent("topic:spicetify-themes")),t&&(r+="&page="+t);const n=await fetch(r).then(e=>e.json()).catch(()=>[]);return n.items||Spicetify.showNotification("Too Many Requests, Cool Down."),u(l({},n),{page_count:n.items.length,items:n.items.filter(e=>!(null!=s&&s.includes(e.html_url)))})}(e,t),r=(!async function(e,t){for(const r of e.items){var s="theme"===t?await async function(t,r,n){try{let e;var s=t.match(new RegExp("https:\\/\\/api\\.github\\.com\\/repos\\/(?<user>.+)\\/(?<repo>.+)\\/contents"));if(!s||!s.groups)return null;const{user:o,repo:a}=s.groups;return e=await k(o,a,r),(e=Array.isArray(e)?e:[e]).reduce((e,t)=>{var s=t.branch||r,s={manifest:t,title:t.name,subtitle:t.description,authors:y(t.authors,o),user:o,repo:a,branch:s,imageURL:t.preview&&t.preview.startsWith("http")?t.preview:`https://raw.githubusercontent.com/${o}/${a}/${s}/`+t.preview,readmeURL:t.readme&&t.readme.startsWith("http")?t.readme:`https://raw.githubusercontent.com/${o}/${a}/${s}/`+t.readme,stars:n,tags:t.tags,cssURL:t.usercss.startsWith("http")?t.usercss:`https://raw.githubusercontent.com/${o}/${a}/${s}/`+t.usercss,schemesURL:t.schemes?t.schemes.startsWith("http")?t.schemes:`https://raw.githubusercontent.com/${o}/${a}/${s}/`+t.schemes:null,include:t.include};return null!=t&&t.name&&null!=t&&t.usercss&&null!=t&&t.description&&e.push(s),e},[])}catch(e){return null}}(r.contents_url,r.default_branch,r.stargazers_count):await async function(t,r,n,o=!1){try{let e;var s=t.match(new RegExp("https:\\/\\/api\\.github\\.com\\/repos\\/(?<user>.+)\\/(?<repo>.+)\\/contents"));if(!s||!s.groups)return null;const{user:a,repo:c}=s.groups;return e=await k(a,c,r),(e=Array.isArray(e)?e:[e]).reduce((e,t)=>{var s=t.branch||r,s={manifest:t,title:t.name,subtitle:t.description,authors:y(t.authors,a),user:a,repo:c,branch:s,imageURL:t.preview&&t.preview.startsWith("http")?t.preview:`https://raw.githubusercontent.com/${a}/${c}/${s}/`+t.preview,extensionURL:t.main.startsWith("http")?t.main:`https://raw.githubusercontent.com/${a}/${c}/${s}/`+t.main,readmeURL:t.readme&&t.readme.startsWith("http")?t.readme:`https://raw.githubusercontent.com/${a}/${c}/${s}/`+t.readme,stars:n,tags:t.tags};return t&&t.name&&t.description&&t.main&&(o&&localStorage.getItem(`marketplace:installed:${a}/${c}/`+t.main)||e.push(s)),e},[])}catch(e){return null}}(r.contents_url,r.default_branch,r.stargazers_count);s&&($(s),await function(t){return new Promise(e=>setTimeout(e,t))}(5e3))}}(s,e),g*(t-1)+s.page_count),n=(console.log({pageOfRepos:s}),s.total_count-r);if(console.log(`Parsed ${r}/${s.total_count} ${e}s`),0<n)return L(e,t+1);console.log(`No more ${e} results`)}(async()=>{for(;null==Spicetify||!Spicetify.LocalStorage||null==Spicetify||!Spicetify.showNotification;)await new Promise(e=>setTimeout(e,100));Spicetify.showNotification("Loaded Marketplace extension!"),window.Marketplace={reset:S};var e=async e=>{const s=f(e);if(s){if(console.log("Initializing theme: ",s),s.schemes){e=s.schemes[s.activeScheme];if(b(e),"true"===localStorage.getItem(d)){var r=s.schemes;let t=0;const n=Object.keys(r).length;setInterval(()=>{t%=n;const e=document.createElement("style");e.className="colorShift-style",e.innerHTML=`* {
      transition-duration: 400ms;
    }
    main-type-bass {
      transition-duration: unset !important;
    }`,document.body.appendChild(e),b(Object.values(r)[t]),t++,e.remove()},6e4)}}else console.warn("No schemes found for theme");const t=document.querySelector("link.marketplaceCSS");t&&t.remove();e=await(async e=>{if(!e.cssURL)throw new Error("No CSS URL provided");const t=-1<e.cssURL.indexOf("raw.githubusercontent.com")?`https://cdn.jsdelivr.net/gh/${e.user}/${e.repo}@${e.branch}/`+e.manifest.usercss:e.cssURL;var s,r=t.replace("/user.css","/assets/");console.log("Parsing CSS: ",t);let n=await fetch(t+"?time="+Date.now()).then(e=>e.text());for(const o of n.matchAll(new RegExp(`url\\(['|"](?<path>.+?)['|"]\\)`,"gm"))||[]){const a=null==(s=null==o?void 0:o.groups)?void 0:s.path;!a||a.startsWith("http")||a.startsWith("data")||(s=r+a.replace(/\.\//g,""),n=n.replace(a,s))}return n})(s);try{const o=document.querySelector("link[href='user.css']"),a=(o&&o.remove(),document.querySelector("style.marketplaceCSS.marketplaceUserCSS"));if(a&&a.remove(),e){const c=document.createElement("style");c.classList.add("marketplaceCSS"),c.classList.add("marketplaceUserCSS"),c.innerHTML=e,document.head.appendChild(c)}else{const i=document.createElement("link");i.setAttribute("rel","stylesheet"),i.setAttribute("href","user.css"),i.classList.add("userCSS"),document.head.appendChild(i)}}catch(e){console.warn(e)}s.include&&s.include.length&&s.include.forEach(e=>{const t=document.createElement("script");let s=e;var r,n,o;-1<e.indexOf("raw.githubusercontent.com")&&({user:e,repo:r,branch:n,filePath:o}=v(e),s=`https://cdn.jsdelivr.net/gh/${e}/${r}@${n}/`+o),t.src=s+"?time="+Date.now(),t.classList.add("marketplaceScript"),document.body.appendChild(t)})}else console.log("No theme manifest found")},t=(console.log("Loaded Marketplace extension"),localStorage.getItem(h));t&&e(t);const s=f(m,[]);e=s.map(e=>f(e));{t=e;const n=document.querySelector("style.marketplaceSnippets"),o=(n&&n.remove(),document.createElement("style"));t=t.reduce((e,t)=>e=(e+=`/* ${t.title} - ${t.description} */
`)+t.code+`
`,""),o.innerHTML=t,o.classList.add("marketplaceSnippets"),document.head.appendChild(o)}const r=f(p,[]);r.forEach(e=>{if((e=f(e=e))&&e.extensionURL){console.log("Initializing extension: ",e);const n=document.createElement("script");if(n.defer=!0,n.src=e.extensionURL,-1<n.src.indexOf("raw.githubusercontent.com")){var{user:e,repo:t,branch:s,filePath:r}=v(e.extensionURL);if(!(e&&t&&s&&r))return;n.src=`https://cdn.jsdelivr.net/gh/${e}/${t}@${s}/`+r}n.src=n.src+"?time="+Date.now(),document.body.appendChild(n)}})})(),async function(){console.log("Preloading extensions and themes..."),window.sessionStorage.clear();var e=await(await fetch("https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/blacklist.json").then(e=>e.json()).catch(()=>({}))).repos;window.sessionStorage.setItem("marketplace:blacklist",JSON.stringify(e)),await Promise.all([L("extension",1),L("theme",1)])}()})();