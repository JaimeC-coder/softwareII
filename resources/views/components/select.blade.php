@props(['items' => [], 'name' ,'id','value'])



@php
    $defaultLink = [];
    $items = $items ?? [$defaultLink];
@endphp


@foreach ($items as $item)
<select name="'name'">
    <option value="{{$item->['id']}}">{{ $item->['value'] }}</option>
</select>
@endforeach


