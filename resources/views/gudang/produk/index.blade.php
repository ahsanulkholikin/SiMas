@extends('layouts.app', ['title' => 'Produk'])

@section('breadcrumb')
<li class="breadcrumb-item">Gudang</li>
@endsection

@section('content')
<div class="row">
    <div class="col">

        <x-card title="Daftar Produk">

            <x-button-add link="{{ route('produk.create') }}" label="Tambah Produk" />

            <x-data-tables :kolomTabel="['No', 'Nama', 'SKU', 'Harga', 'Stok','Limit Stok', 'Aksi']">
                @forelse ($data as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $item->nama }}</td>
                    <td>{{ $item->sku }}</td>
                    <td>{{ $item->harga_jual }}</td>
                    <td>{{ $item->inventaris()->sum('stok') }}</td>
                    <td>
                        @if($item->limit_stok <= $item->inventaris()->sum('stok')){{ $item->limit_stok }}@else <button type="button" class="btn btn-warning">Limit {{$item->limit_stok}}</button> @endif
                    </td>
                    <td>
                        
                        <!-- <x-button-show link="{{ route('produk.show', $item->id) }}" /> -->
                        <x-button-edit link="{{ route('produk.edit', $item->id) }}" />
                        <x-button-delete link="{{ route('produk.destroy', $item->id) }}" />
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="text-center">Tidak ada data</td>
                </tr>
                @endforelse
            </x-data-tables>

        </x-card>

    </div>
</div>
@endsection