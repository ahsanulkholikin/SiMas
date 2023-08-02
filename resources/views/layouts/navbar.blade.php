<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        

        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge">{{ countNot() }}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">{{ countNot() }} Produk Hampis Habis</span>
                <div class="dropdown-divider"></div>
                @forelse(getNot() as $nono)
                <a href="{{ route('produk.edit', $nono->id) }}" class="dropdown-item">
                    {{ $nono->nama }}
                    <span class="float-right text-muted text-sm">{{ $nono->stok }}</span>
                </a>
                <div class="dropdown-divider"></div>
                @empty
                <a href="#" class="dropdown-item">
                    Produk Masih Lengkap
                </a>
                <div class="dropdown-divider"></div>
                @endforelse
                <a href="{{ route('produk.index') }}" class="dropdown-item dropdown-footer">Lihat Semua Produk</a>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
    </ul>

</nav>