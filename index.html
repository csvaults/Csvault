<!DOCTYPE html>
<html lang="id" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Csvault - Premium Visual Novel Hub</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#f5f3ff', 100: '#ede9fe', 300: '#c4b5fd', 400: '#a78bfa',
                            500: '#8b5cf6', 600: '#7c3aed', 700: '#6d28d9', 800: '#5b21b6', 900: '#2e1065',
                        },
                        dark: '#09090b',
                        darkCard: '#18181b',
                        borderColor: '#27272a',
                    },
                    animation: {
                        'fade-in': 'fadeIn 0.3s ease-out',
                        'slide-up': 'slideUp 0.4s ease-out',
                    },
                    keyframes: {
                        fadeIn: { '0%': { opacity: '0' }, '100%': { opacity: '1' } },
                        slideUp: { '0%': { opacity: '0', transform: 'translateY(20px)' }, '100%': { opacity: '1', transform: 'translateY(0)' } }
                    }
                }
            }
        }
    </script>
    
    <!-- Alpine.js -->
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #09090b; color: #f4f4f5; -webkit-tap-highlight-color: transparent; }
        .glass-nav { background: rgba(9, 9, 11, 0.7); backdrop-filter: blur(16px); -webkit-backdrop-filter: blur(16px); border-bottom: 1px solid rgba(255,255,255,0.05); }
        .glass-card { background: linear-gradient(145deg, #18181b 0%, #0f0f11 100%); border: 1px solid #27272a; box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5); }
        
        /* Hide Scrollbar for Horizontal Scrolling */
        .hide-scrollbar::-webkit-scrollbar { display: none; }
        .hide-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
        
        /* Smooth Image Hover */
        .game-img-wrapper img { transition: transform 0.5s ease; }
        .group:hover .game-img-wrapper img { transform: scale(1.1); }
        
        [x-cloak] { display: none !important; }
    </style>
</head>
<body x-data="csvaultApp()" x-init="initApp()" class="min-h-screen flex flex-col relative pb-20 md:pb-0">

    <!-- TOP NAVIGATION -->
    <header class="sticky top-0 z-40 glass-nav">
        <div class="container mx-auto px-4 h-16 flex items-center justify-between">
            <div class="flex items-center gap-3 cursor-pointer" @click="window.scrollTo({top:0, behavior:'smooth'})">
                <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-brand-500 to-brand-700 flex items-center justify-center shadow-lg shadow-brand-500/40">
                    <i class="fas fa-bolt text-white text-lg"></i>
                </div>
                <span class="text-2xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-white to-brand-300 tracking-tight">
                    Csvault
                </span>
            </div>
            
            <div class="flex items-center gap-4">
                <button @click="showBookmarks = !showBookmarks" class="relative p-2 text-gray-400 hover:text-pink-500 transition">
                    <i class="fas fa-heart text-xl"></i>
                    <span x-show="bookmarkedIds.length > 0" class="absolute top-1 right-0 w-2.5 h-2.5 bg-pink-500 rounded-full border-2 border-dark animate-pulse"></span>
                </button>
                <div class="hidden md:flex items-center gap-2 bg-darkCard border border-borderColor rounded-full px-4 py-2">
                    <i class="fas fa-search text-gray-500 text-sm"></i>
                    <input type="text" x-model="searchQuery" placeholder="Cari game..." class="bg-transparent border-none outline-none text-sm w-48 text-white placeholder-gray-500">
                </div>
            </div>
        </div>
    </header>

    <main class="container mx-auto px-4 py-6 flex-grow space-y-8 max-w-7xl">

        <!-- HERO HIGHLIGHT -->
        <section x-show="!showBookmarks && !searchQuery" class="animate-slide-up relative rounded-3xl overflow-hidden glass-card aspect-[16/9] md:aspect-[21/9]">
            <img :src="featuredGame.posterUrl" class="absolute inset-0 w-full h-full object-cover opacity-40">
            <div class="absolute inset-0 bg-gradient-to-t from-dark via-dark/80 to-transparent"></div>
            <div class="absolute inset-0 bg-gradient-to-r from-dark via-dark/50 to-transparent"></div>
            
            <div class="absolute bottom-0 left-0 p-6 md:p-10 w-full md:w-2/3 space-y-3">
                <div class="flex items-center gap-2">
                    <span class="px-3 py-1 rounded-full bg-brand-600/80 backdrop-blur text-[10px] md:text-xs font-bold text-white border border-brand-500">
                        <i class="fas fa-fire mr-1"></i> TRENDING #1
                    </span>
                    <span class="px-3 py-1 rounded-full bg-darkCard/80 backdrop-blur text-[10px] md:text-xs font-bold text-brand-300 border border-borderColor">
                        Terjemahan ID
                    </span>
                </div>
                <h1 class="text-3xl md:text-5xl font-extrabold text-white leading-tight" x-text="featuredGame.title"></h1>
                <p class="text-gray-300 text-xs md:text-sm line-clamp-2 max-w-xl" x-text="featuredGame.description"></p>
                
                <div class="pt-2 flex gap-3">
                    <button @click="openDetail(featuredGame)" class="px-6 py-3 rounded-xl bg-white text-black font-bold text-sm hover:bg-gray-200 transition flex items-center gap-2 shadow-[0_0_20px_rgba(255,255,255,0.3)]">
                        <i class="fas fa-play"></i> Lihat Game
                    </button>
                    <button @click="toggleBookmark(featuredGame.id)" class="w-12 h-12 rounded-xl bg-darkCard/50 backdrop-blur border border-borderColor flex items-center justify-center text-white hover:bg-darkCard transition">
                        <i class="fas fa-heart" :class="isBookmarked(featuredGame.id) ? 'text-pink-500' : 'text-gray-400'"></i>
                    </button>
                </div>
            </div>
        </section>

        <!-- HEADER TITLE & SORTING -->
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 animate-fade-in">
            <h2 class="text-xl md:text-2xl font-bold flex items-center gap-2">
                <i class="fas fa-compass text-brand-500"></i>
                <span x-text="showBookmarks ? 'Koleksi Favorit Kamu' : 'Eksplorasi Katalog'"></span>
            </h2>
            
            <!-- Mobile Search Bar (Only visible on small screens) -->
            <div class="md:hidden relative w-full">
                <i class="fas fa-search absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 text-sm"></i>
                <input type="text" x-model="searchQuery" placeholder="Cari judul game..." class="w-full pl-10 pr-4 py-3 rounded-xl glass-card text-sm text-white focus:border-brand-500 outline-none">
            </div>

            <!-- Sorting & Filter -->
            <div class="flex items-center gap-2 overflow-x-auto hide-scrollbar pb-1">
                <select x-model="sortBy" class="bg-darkCard border border-borderColor text-gray-300 text-xs rounded-xl px-3 py-2 outline-none focus:border-brand-500 whitespace-nowrap">
                    <option value="rating">Urutkan: Rating Tertinggi</option>
                    <option value="az">Urutkan: A - Z</option>
                    <option value="size">Urutkan: Ukuran Terkecil</option>
                </select>
            </div>
        </div>

        <!-- SWIPEABLE CATEGORIES -->
        <div x-show="!showBookmarks" class="flex items-center gap-2 overflow-x-auto hide-scrollbar pb-2 animate-fade-in">
            <template x-for="cat in categories">
                <button @click="activeCategory = cat" 
                        class="px-5 py-2 rounded-full text-xs font-semibold whitespace-nowrap transition-all duration-300 border"
                        :class="activeCategory === cat ? 'bg-brand-600 text-white border-brand-500 shadow-[0_0_15px_rgba(124,58,237,0.4)]' : 'bg-darkCard text-gray-400 border-borderColor hover:text-white'">
                    <span x-text="cat"></span>
                </button>
            </template>
        </div>

        <!-- GRID GAMES -->
        <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 md:gap-6 pb-10">
            <template x-for="game in processedGames()" :key="game.id">
                <div class="group relative rounded-2xl glass-card overflow-hidden flex flex-col cursor-pointer animate-slide-up" @click="openDetail(game)">
                    
                    <!-- Hati / Bookmark Icon (Absolute top right) -->
                    <button @click.stop="toggleBookmark(game.id)" class="absolute top-2 right-2 z-20 w-8 h-8 rounded-full bg-black/50 backdrop-blur border border-white/10 flex items-center justify-center transition-transform hover:scale-110">
                        <i class="fas fa-heart text-sm transition-colors" :class="isBookmarked(game.id) ? 'text-pink-500 drop-shadow-[0_0_5px_rgba(236,72,153,0.8)]' : 'text-gray-400'"></i>
                    </button>

                    <!-- Poster -->
                    <div class="game-img-wrapper relative aspect-[3/4] bg-darkCard overflow-hidden">
                        <img :src="game.posterUrl" class="w-full h-full object-cover">
                        <!-- Gradient Overlay -->
                        <div class="absolute inset-0 bg-gradient-to-t from-darkCard via-transparent to-transparent opacity-90 group-hover:opacity-100 transition-opacity"></div>
                        
                        <!-- Badges -->
                        <div class="absolute bottom-2 left-2 flex flex-wrap gap-1 z-10">
                            <span x-show="game.isNew" class="px-2 py-0.5 rounded text-[9px] font-bold bg-brand-500 text-white">BARU</span>
                            <span class="px-2 py-0.5 rounded text-[9px] font-bold bg-dark/80 text-brand-300 border border-brand-900" x-text="game.tags[0]"></span>
                        </div>
                    </div>

                    <!-- Info -->
                    <div class="p-3 md:p-4 flex flex-col justify-between flex-grow">
                        <div>
                            <h3 x-text="game.title" class="font-bold text-white text-xs md:text-sm line-clamp-1 group-hover:text-brand-400 transition-colors"></h3>
                            <p x-text="game.category" class="text-[10px] text-gray-500 mt-1"></p>
                        </div>
                        <div class="flex items-center justify-between mt-3 pt-3 border-t border-white/5">
                            <div class="flex items-center gap-1 text-[11px] font-bold text-yellow-400">
                                <i class="fas fa-star text-[10px]"></i> <span x-text="game.rating"></span>
                            </div>
                            <span class="text-[10px] font-mono text-gray-400 bg-white/5 px-1.5 py-0.5 rounded" x-text="game.fileSize"></span>
                        </div>
                    </div>
                </div>
            </template>
        </div>

        <!-- STATE KOSONG -->
        <div x-show="processedGames().length === 0" class="text-center py-20 animate-fade-in">
            <div class="w-20 h-20 mx-auto rounded-full bg-darkCard border border-borderColor flex items-center justify-center mb-4">
                <i class="fas fa-ghost text-3xl text-gray-600"></i>
            </div>
            <h3 class="text-lg font-bold text-white">Tidak ada game ditemukan</h3>
            <p class="text-sm text-gray-500 mt-1">Coba gunakan kata kunci atau kategori lain.</p>
            <button @click="resetAll()" class="mt-4 px-4 py-2 rounded-lg bg-brand-600/20 text-brand-400 text-sm font-medium hover:bg-brand-600 hover:text-white transition">
                Reset Pencarian
            </button>
        </div>

    </main>

    <!-- POPUP MODAL (FULLSCREEN ON MOBILE, CENTERED ON DESKTOP) -->
    <div x-show="isModalOpen" x-cloak class="fixed inset-0 z-50 flex items-end md:items-center justify-center bg-black/60 backdrop-blur-sm"
         x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-200" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">
        
        <div @click.outside="closeDetail()" class="w-full md:max-w-2xl bg-[#131316] md:rounded-3xl rounded-t-3xl border-t md:border border-borderColor overflow-hidden flex flex-col max-h-[90vh] shadow-2xl"
             x-transition:enter="transition ease-out duration-300" x-transition:enter-start="translate-y-full md:translate-y-10 md:scale-95" x-transition:enter-end="translate-y-0 md:scale-100">
            
            <!-- Modal Cover -->
            <div class="relative h-48 md:h-64 w-full bg-darkCard shrink-0">
                <img :src="activeGame.posterUrl" class="w-full h-full object-cover opacity-50">
                <div class="absolute inset-0 bg-gradient-to-t from-[#131316] to-transparent"></div>
                
                <button @click="closeDetail()" class="absolute top-4 right-4 w-8 h-8 rounded-full bg-black/50 text-white flex items-center justify-center hover:bg-red-500 transition border border-white/20">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <!-- Modal Content (Scrollable) -->
            <div class="px-5 pb-5 pt-2 flex-grow overflow-y-auto hide-scrollbar relative z-10 -mt-10">
                <div class="flex items-start justify-between mb-4 gap-4">
                    <div>
                        <span class="px-2 py-0.5 rounded text-[10px] font-bold bg-brand-600 text-white shadow-lg shadow-brand-500/30" x-text="activeGame.category"></span>
                        <h2 class="text-xl md:text-2xl font-extrabold text-white mt-2 leading-tight" x-text="activeGame.title"></h2>
                    </div>
                    <button @click="toggleBookmark(activeGame.id)" class="shrink-0 w-12 h-12 rounded-full glass-card flex items-center justify-center text-xl shadow-lg">
                        <i class="fas fa-heart" :class="isBookmarked(activeGame.id) ? 'text-pink-500 drop-shadow-[0_0_8px_rgba(236,72,153,0.8)]' : 'text-gray-400'"></i>
                    </button>
                </div>

                <div class="grid grid-cols-3 gap-2 mb-5">
                    <div class="glass-card rounded-xl p-3 text-center border border-white/5">
                        <i class="fas fa-star text-yellow-400 text-sm mb-1"></i>
                        <div class="text-xs font-bold text-white" x-text="activeGame.rating"></div>
                        <div class="text-[9px] text-gray-500">Rating</div>
                    </div>
                    <div class="glass-card rounded-xl p-3 text-center border border-white/5">
                        <i class="fas fa-hdd text-brand-400 text-sm mb-1"></i>
                        <div class="text-xs font-bold text-white" x-text="activeGame.fileSize"></div>
                        <div class="text-[9px] text-gray-500">Ukuran</div>
                    </div>
                    <div class="glass-card rounded-xl p-3 text-center border border-white/5">
                        <i class="fas fa-language text-green-400 text-sm mb-1"></i>
                        <div class="text-xs font-bold text-white">Tersedia</div>
                        <div class="text-[9px] text-gray-500">B. Indonesia</div>
                    </div>
                </div>

                <div class="space-y-3 mb-6">
                    <h3 class="text-sm font-bold text-white border-b border-borderColor pb-2">Tentang Game</h3>
                    <p class="text-xs md:text-sm text-gray-300 leading-relaxed" x-text="activeGame.description"></p>
                </div>
            </div>

            <!-- Modal Action Buttons (Sticky Bottom) -->
            <div class="p-4 bg-[#0a0a0c] border-t border-borderColor grid grid-cols-4 gap-3 shrink-0">
                <button @click="copyLink()" class="col-span-1 rounded-xl glass-card flex items-center justify-center text-gray-300 hover:text-white transition">
                    <i class="fas fa-share-nodes"></i>
                </button>
                <a :href="activeGame.downloadUrl" target="_blank" class="col-span-3 py-3.5 rounded-xl bg-brand-600 hover:bg-brand-500 text-white font-bold text-center text-sm shadow-[0_0_20px_rgba(124,58,237,0.4)] flex items-center justify-center gap-2 transition-transform active:scale-95">
                    <i class="fas fa-download"></i> Unduh Sekarang
                </a>
            </div>
        </div>
    </div>

    <!-- TOAST NOTIFICATION -->
    <div x-show="toast.show" x-cloak 
         x-transition:enter="transition ease-out duration-300" x-transition:enter-start="translate-y-10 opacity-0" x-transition:enter-end="translate-y-0 opacity-100"
         x-transition:leave="transition ease-in duration-300" x-transition:leave-start="translate-y-0 opacity-100" x-transition:leave-end="translate-y-10 opacity-0"
         class="fixed bottom-6 left-1/2 -translate-x-1/2 z-[100] px-6 py-3 rounded-full bg-white text-black text-xs font-bold shadow-[0_10px_40px_rgba(0,0,0,0.5)] flex items-center gap-2">
        <i :class="toast.icon" class="text-lg"></i>
        <span x-text="toast.message"></span>
    </div>

    <!-- ALPINE LOGIC -->
    <script>
        function csvaultApp() {
            return {
                // DATA
                searchQuery: '',
                activeCategory: 'Semua',
                sortBy: 'rating',
                showBookmarks: false,
                isModalOpen: false,
                activeGame: {},
                bookmarkedIds: [],
                categories: ['Semua', 'Romance', 'Horror', 'Slice of Life', 'Sci-Fi', 'Comedy'],
                
                toast: { show: false, message: '', icon: '' },
                toastTimeout: null,
                
                games: [
                    { id: 1, title: 'Summer Memories', category: 'Slice of Life', rating: 4.9, fileSize: '750 MB', isNew: true, tags: ['Bahasa', 'RenPy'], posterUrl: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=800&q=80', description: 'Visual novel santai tentang petualangan musim panas yang berkesan di pedesaan. Sepenuhnya diterjemahkan ke Bahasa Indonesia dengan alur cerita emosional dan interaksi mendalam.', downloadUrl: '#' },
                    { id: 2, title: 'Doki Doki Literature', category: 'Horror', rating: 4.8, fileSize: '350 MB', isNew: false, tags: ['Gratis', 'Horror'], posterUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800&q=80', description: 'Bergabunglah dengan klub sastra! Namun bersiaplah, karena di balik puisi manis, ada misteri psikologikal yang akan mematahkan pikiranmu.', downloadUrl: '#' },
                    { id: 3, title: 'Katawa Shoujo', category: 'Romance', rating: 4.9, fileSize: '1.2 GB', isNew: false, tags: ['Gratis', 'Drama'], posterUrl: 'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800&q=80', descriptio
