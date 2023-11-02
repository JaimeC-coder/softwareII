<div class="box box-info padding-1">
    <div class="box-body">
        <div class="form-group">
            {{ Form::label('tpagotipo','Tipo de Pago') }}
            {{ Form::text('tpagotipo', $tipoPago->tpagotipo, ['class' => 'form-control' . ($errors->has('tpagotipo') ? ' is-invalid' : ''), 'placeholder' => 'Tipo de Comprobante']) }}
            {!! $errors->first('tpagotipo', '<div class="invalid-feedback">:message</div>') !!}
        </div>

    </div>
    <div class="box-footer mt20">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>
