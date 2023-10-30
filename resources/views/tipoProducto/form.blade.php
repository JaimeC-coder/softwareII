<div class="box box-info padding-1">
    <div class="box-body">
        <div class="form-group">
            {{ Form::label('tpronombre','Tipo de Producto') }}
            {{ Form::text('tpronombre', $tipoProducto->tpronombre, ['class' => 'form-control' . ($errors->has('tpronombre') ? ' is-invalid' : ''), 'placeholder' => 'Tipo de Producto']) }}
            {!! $errors->first('tpronombre', '<div class="invalid-feedback">:message</div>') !!}
        </div>

    </div>
    <div class="box-footer mt20">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>
