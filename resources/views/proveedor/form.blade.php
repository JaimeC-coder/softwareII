<div class="box box-info padding-1">
    <div class="box-body">


        <div class="form-group">
            {{ Form::label('provdoc','Documento') }}
            {{ Form::text('provdoc', $proveedores->provdoc, ['class' => 'form-control' . ($errors->has('provdoc') ? ' is-invalid' : ''), 'placeholder' => 'Documento']) }}
            {!! $errors->first('provdoc', '<div class="invalid-feedback">:message</div>') !!}
        </div>
        <div class="form-group">
            {{ Form::label('provtelefono','Telefono') }}
            {{ Form::text('provtelefono', $proveedores->provtelefono, ['class' => 'form-control' . ($errors->has('provtelefono') ? ' is-invalid' : ''), 'placeholder' => 'Telefono']) }}
            {!! $errors->first('provtelefono', '<div class="invalid-feedback">:message</div>') !!}
        </div>
        <div class="form-group">
            {{ Form::label('provcorreo','Correo') }}
            {{ Form::text('provcorreo', $proveedores->provcorreo, ['class' => 'form-control' . ($errors->has('provcorreo') ? ' is-invalid' : ''), 'placeholder' => 'Correo']) }}
            {!! $errors->first('provcorreo', '<div class="invalid-feedback">:message</div>') !!}
        </div>
        <div class="form-group">
            {{ Form::label('provdireccion','Direccion') }}
            {{ Form::text('provdireccion', $proveedores->provdireccion, ['class' => 'form-control' . ($errors->has('provdireccion') ? ' is-invalid' : ''), 'placeholder' => 'Direccion']) }}
            {!! $errors->first('provdireccion', '<div class="invalid-feedback">:message</div>') !!}
        </div>
        <div class="form-group">
            {{ Form::label('provrazonsocial','Razon Social') }}
            {{ Form::text('provrazonsocial', $proveedores->provrazonsocial, ['class' => 'form-control' . ($errors->has('provrazonsocial') ? ' is-invalid' : ''), 'placeholder' => 'Razon Social']) }}
            {!! $errors->first('provrazonsocial', '<div class="invalid-feedback">:message</div>') !!}
        </div>

    </div>
    <div class="box-footer mt20">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>
