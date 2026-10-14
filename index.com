<html lang="id" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Csvault - Portal Game Visual Novel</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#f5f3ff', 100: '#ede9fe', 400: '#a78bfa',
                            500: '#8b5cf6', 600: '#7c3aed', 700: '#6d28d9',
                            800: '#5b21b6', 900: '#2e1065',
                        },
                        dark: '#0f0b1e',
                        darkAccent: '#1a142e',
                        border: '#2a2245',
                    }
                }
            }
        }
    </script>
    <!-- Alpine.js -->
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #0f0b1e; color: #f5f3ff; }
        .glass { background: rgba(26, 20, 46, 0.9); backdrop-filter: blur(12px); border: 1px solid #2a2245; }
        .game-card-hover { transition: all 0.3s ease; }
        .game-card-hover:hover { transform: translateY(-4px); box-shadow: 0 8px 20px rgba(124, 58, 237, 0.3); border-color: #a78bfa; }
        .filter-btn-active { background-color: #7c3aed; color: white; border-color: #a78bfa; }
        .filter-btn-inactive { background-color: #1a142e; color: #a78bfa; border-color: #2a2245; }
        [x-cloak] { display: none !important; }
    </style>
</head>
<body x-data="csvaultApp()" class="min-h-screen flex flex-col justify-between">

    <!-- HEADER -->
    <header class="sticky top-0 z-40 glass border-b border-border">
        <nav class="container mx-auto px-4 py-3 flex items-center justify-between">
            <div class="flex items-center gap-2.5">
                <div class="w-9 h-9 rounded-xl bg-brand-600 flex items-center justify-center border border-brand-400 shadow-lg shadow-brand-900/50">
                    <i class="fas fa-box-archive text-white"></i>
                </div>
                <span class="text-xl font-extrabold text-brand-400">Csvault</span>
            </div>
            <div class="flex items-center gap-2">
                <span class="text-xs px-3 py-1 rounded-full bg-brand-900/60 border border-brand-700 text-brand-300 font-medium">
                    <i class="fas fa-gamepad text-brand-400 mr-1"></i> Komunitas VN ID
                </span>
            </div>
        </nav>
    </header>

    <main class="container mx-auto px-4 py-5 space-y-6 flex-grow">

        <!-- HERO SECTION -->
        <section class="p-5 md:p-8 rounded-3xl relative overflow-hidden glass border-2 border-brand-800 shadow-xl shadow-brand-900/30">
            <div class="relative z-10 space-y-3">
                <div class="flex flex-wrap gap-2">
                    <span class="px-3 py-1 rounded-full text-[10px] font-bold bg-pink-600 text-white shadow">REKOMENDASI UTAMA</span>
                    <span class="px-3 py-1 rounded-full text-[10px] font-bold bg-brand-600 text-white shadow">Bahasa Indonesia</span>
                </div>
                <h1 class="text-2xl md:text-4xl font-extrabold text-white leading-tight">Summer Memories: <span class="text-brand-400">Indonesia Translation</span></h1>
                <p class="text-brand-100 text-xs md:text-sm max-w-xl leading-relaxed">
                    Petualangan liburan musim panas yang santai, penuh cerita emosional, kini hadir dengan terjemahan Bahasa Indonesia penuh.
                </p>
                <div class="pt-2 flex items-center gap-3">
                    <button @click="openDetail(games[0])" class="px-5 py-2.5 rounded-xl bg-brand-600 hover:bg-brand-500 text-white font-bold text-xs flex items-center gap-2 transition shadow-lg shadow-brand-900/50">
                        <i class="fas fa-info-circle"></i> Lihat Detail & Unduh
                    </button>
                    <div class="flex items-center gap-1.5 text-yellow-400 text-xs font-bold">
                        <i class="fas fa-star"></i> <span>4.9/5.0</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- FILTER & PENCARIAN -->
        <section class="p-4 rounded-2xl glass shadow-md space-y-3">
            <div class="flex items-center justify-between">
                <h2 class="text-sm font-bold text-brand-300 flex items-center gap-2">
                    <i class="fas fa-filter text-brand-400"></i> Cari & Filter Katalog
                </h2>
                <button @click="resetFilters()" class="text-[11px] text-brand-400 underline">Reset</button>
            </div>
            <div class="relative">
                <i class="fas fa-search absolute left-3.5 top-1/2 -translate-y-1/2 text-brand-500 text-xs"></i>
                <input type="text" x-model="searchQuery" placeholder="Cari judul game..." 
                       class="w-full pl-10 pr-3 py-2.5 rounded-xl bg-darkAccent border border-border text-white text-xs outline-none focus:border-brand-500">
            </div>
            <div class="flex flex-wrap gap-1.5">
                <template x-for="tag in availableTags">
                    <button @click="toggleTag(tag)" x-text="tag" 
                            class="px-2.5 py-1 rounded-lg text-[11px] font-medium border transition"
                            :class="selectedTags.includes(tag) ? 'filter-btn-active' : 'filter-btn-inactive'"></button>
                </template>
            </div>
        </section>

        <!-- GRID DAFTAR GAME -->
        <section>
            <div class="mb-3 flex items-center justify-between text-xs text-brand-400">
                <span>Total Katalog: <strong class="text-white" x-text="filteredGames().length"></strong> Game</span>
            </div>

            <div class="grid grid-cols-2 gap-3.5 md:grid-cols-4 lg:grid-cols-5">
                <template x-for="game in filteredGames()" :key="game.id">
                    <div class="game-card-hover glass rounded-2xl flex flex-col overflow-hidden border border-border">
                        <div class="relative aspect-[3/4] bg-darkAccent">
                            <img :src="game.posterUrl" :alt="game.title" class="w-full h-full object-cover">
                            <div class="absolute bottom-1.5 left-1.5 flex gap-1">
                                <template x-for="tag in game.tags">
                                    <span x-text="tag" class="px-1.5 py-0.5 rounded text-[9px] bg-brand-900/90 text-brand-200 border border-brand-700"></span>
                                </template>
                            </div>
                        </div>
                        <div class="p-3 flex flex-col justify-between flex-grow space-y-2">
                            <div>
                                <h3 x-text="game.title" class="font-semibold text-white text-xs line-clamp-1"></h3>
                                <p x-text="game.genre" class="text-[10px] text-brand-400"></p>
                            </div>
                            <div class="flex items-center justify-between text-[11px] pt-1 border-t border-border/50">
                                <span class="text-yellow-400 font-bold"><i class="fas fa-star text-[10px]"></i> <span x-text="game.rating"></span></span>
                                <span class="text-brand-300 font-mono text-[10px]" x-text="game.fileSize"></span>
                            </div>
                            <!-- Tombol Detail yang memanggil Popup (Modal) -->
                            <button @click="openDetail(game)" class="w-full text-center py-2 rounded-xl bg-brand-600 hover:bg-brand-500 text-white text-[11px] font-bold transition shadow">
                                Unduh / Detail
                            </button>
                        </div>
                    </div>
                </template>
            </div>

            <!-- Kosong -->
            <div x-show="filteredGames().length === 0" x-cloak class="text-center py-10 glass rounded-2xl space-y-2">
                <i class="fas fa-ghost text-3xl text-brand-600"></i>
                <p class="text-white text-xs font-bold">Game tidak ditemukan</p>
            </div>
        </section>

    </main>

    <!-- POPUP MODAL DETAIL GAME (MUNCUL SAAT DIKLIK) -->
    <div x-show="isModalOpen" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm">
        <div @click.outside="isModalOpen = false" class="glass w-full max-w-lg rounded-3xl p-5 border border-brand-700 space-y-4 max-h-[90vh] overflow-y-auto">
            <div class="flex items-start justify-between">
                <div class="space-y-1">
                    <span class="text-[10px] px-2.5 py-0.5 rounded-full bg-brand-900 text-brand-300 border border-brand-700" x-text="activeGame.genre"></span>
                    <h2 class="text-lg font-bold text-white" x-text="activeGame.title"></h2>
                </div>
                <button @click="isModalOpen = false" class="p-2 text-brand-400 hover:text-white"><i class="fas fa-times text-base"></i></button>
            </div>

            <div class="aspect-video w-full rounded-2xl overflow-hidden bg-darkAccent border border-border">
                <img :src="activeGame.posterUrl" class="w-full h-full object-cover">
            </div>

            <div class="space-y-2 text-xs text-brand-100">
                <p class="font-semibold text-brand-300">Deskripsi Game:</p>
                <p x-text="activeGame.description" class="leading-relaxed text-brand-200"></p>
                
                <div class="grid grid-cols-2 gap-2 pt-2 border-t border-border">
                    <div class="p-2.5 rounded-xl bg-darkAccent border border-border">
                        <span class="text-brand-400 block text-[10px]">Ukuran File</span>
                        <strong class="text-white font-mono" x-text="activeGame.fileSize"></strong>
                    </div>
                    <div class="p-2.5 rounded-xl bg-darkAccent border border-border">
                        <span class="text-brand-400 block text-[10px]">Rating Pengguna</span>
                        <strong class="text-yellow-400" x-text="activeGame.rating + ' / 5.0'"></strong>
                    </div>
                </div>
            </div>

            <div class="pt-2 flex gap-2">
                <a :href="activeGame.downloadUrl" target="_blank" class="flex-grow py-3 rounded-xl bg-brand-600 hover:bg-brand-500 text-white font-bold text-center text-xs shadow-lg shadow-brand-900/50 flex items-center justify-center gap-2">
                    <i class="fas fa-download"></i> Unduh File Game Sekarang
                </a>
                <button @click="isModalOpen = false" class="px-4 py-3 rounded-xl bg-darkAccent border border-border text-xs text-brand-300">Tutup</button>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer class="mt-auto glass border-t border-border py-4 text-center">
        <p class="text-[11px] text-brand-400">&copy; 2026 Csvault. Portal Vault Game Interaktif.</p>
    </footer>

    <!-- ALPINE.JS LOGIC -->
    <script>
        function csvaultApp() {
            return {
                searchQuery: '',
                selectedTags: [],
                availableTags: ['Bahasa', 'Gratis', 'RenPy', 'Unity', 'Top'],
                isModalOpen: false,
                activeGame: {},
                games: [
                    { 
                        id: 1, 
                        title: 'Summer Memories', 
                        genre: 'Slice of Life / Bahasa', 
                        rating: 4.9, 
                        fileSize: '750 MB', 
                        posterUrl: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=500&auto=format&fit=crop', 
                        description: 'Visual novel santai tentang petualangan musim panas yang berkesan di pedesaan. Sepenuhnya diterjemahkan ke Bahasa Indonesia dengan alur cerita yang menyentuh.',
                        downloadUrl: '#',
                        tags: ['Bahasa', 'RenPy'] 
                    },
                    { 
                        id: 2, 
                        title: 'Doki Doki Literature', 
                        genre: 'Horror / Psychological', 
                        rating: 4.8, 
                        fileSize: '350 MB', 
                        posterUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500&auto=format&fit=crop', 
                        description: 'Gabungkan puisi dan romansa klub sastra dalam game psikologikal horor yang sangat terkenal dan mengejutkan.',
                        downloadUrl: '#',
                        tags: ['Gratis'] 
                    },
                    { 
                        id: 3, 
                        title: 'Katawa Shoujo', 
                        genre: 'Drama / Romance', 
                        rating: 4.9, 
                        fileSize: '1.2 GB', 
                        posterUrl: 'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=500&auto=format&fit=crop', 
                        description: 'Sebuah kisah tentang kehidupan, cinta, dan persahabatan di sekolah khusus penyandang disabilitas.',
                        downloadUrl: '#',
                        tags: ['Gratis', 'RenPy'] 
                    },
                    { 
                        id: 4, 
                        title: 'Steins;Gate', 
                        genre: 'Sci-Fi / Adventure', 
                        rating: 5.0, 
                        fileSize: '4.5 GB', 
                        posterUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500&auto=format&fit=crop', 
                        description: 'Sekelompok ilmuwan amatir menemukan cara untuk mengirim pesan ke masa lalu, memicu konspirasi besar linimasa waktu.',
                        downloadUrl: '#',
                        tags: ['Top'] 
                    },
                    { 
                        id: 5, 
                        title: 'Nekopara Vol. 1', 
                        genre: 'Comedy / Romance', 
                        rating: 4.7, 
                        fileSize: '1.8 GB', 
                        posterUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500&auto=format&fit=crop', 
                        description: 'Kisah manis dan komikal tentang pemuda pembuat toko kue yang hidup bersama gadis-gadis kucing (nekopara).',
                        downloadUrl: '#',
                        tags: ['Unity'] 
                    }
                ],
                filteredGames() {
                    return this.games.filter(game => {
                        const searchMatch = !this.searchQuery || game.title.toLowerCase().includes(this.searchQuery.toLowerCase());
                        const tagsMatch = this.selectedTags.length === 0 || this.selectedTags.every(tag => game.tags.includes(tag));
                        return searchMatch && tagsMatch;
                    });
                },
                toggleTag(tag) {
                    if (this.selectedTags.includes(tag)) {
                        this.selectedTags = this.selectedTags.filter(t => t !== tag);
                    } else {
                        this.selectedTags.push(tag);
                    }
                },
                resetFilters() {
                    this.searchQuery = '';
                    this.selectedTags = [];
                },
                openDetail(game) {
                    this.activeGame = game;
                    this.isModalOpen = true;
                }
            }
        }
    </script>
</body>
</html>
