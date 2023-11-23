<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Title
    |--------------------------------------------------------------------------
    |
    | Here you can change the default title of your admin panel.
    |
    | For detailed instructions you can look the title section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'title' => '',
    'title_prefix' => env('APP_NAME', 'Laravel') . '|',
    'title_postfix' => '',

    /*
    |--------------------------------------------------------------------------
    | Favicon
    |--------------------------------------------------------------------------
    |
    | Here you can activate the favicon.
    |
    | For detailed instructions you can look the favicon section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'use_ico_only' => false,
    'use_full_favicon' => false,

    /*
    |--------------------------------------------------------------------------
    | Google Fonts
    |--------------------------------------------------------------------------
    |
    | Here you can allow or not the use of external google fonts. Disabling the
    | google fonts may be useful if your admin panel internet access is
    | restricted somehow.
    |
    | For detailed instructions you can look the google fonts section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'google_fonts' => [
        'allowed' => true,
    ],

    /*
    |--------------------------------------------------------------------------
    | Admin Panel Logo
    |--------------------------------------------------------------------------
    |
    | Here you can change the logo of your admin panel.
    |
    | For detailed instructions you can look the logo section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'logo' => env('APP_NAME', 'Laravel'),
    'logo_img' => 'vendor/adminlte/dist/img/AdminLTELogo.png',
    'logo_img_class' => 'brand-image img-circle elevation-3',
    'logo_img_xl' => null,
    'logo_img_xl_class' => 'brand-image-xs',
    'logo_img_alt' => 'Admin Logo',

    /*
    |--------------------------------------------------------------------------
    | Authentication Logo
    |--------------------------------------------------------------------------
    |
    | Here you can setup an alternative logo to use on your login and register
    | screens. When disabled, the admin panel logo will be used instead.
    |
    | For detailed instructions you can look the auth logo section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'auth_logo' => [
        'enabled' => false,
        'img' => [
            'path' => 'vendor/adminlte/dist/img/AdminLTELogo.png',
            'alt' => 'Auth Logo',
            'class' => '',
            'width' => 50,
            'height' => 50,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Preloader Animation
    |--------------------------------------------------------------------------
    |
    | Here you can change the preloader animation configuration.
    |
    | For detailed instructions you can look the preloader section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'preloader' => [
        'enabled' => true,
        'img' => [
            'path' => 'vendor/adminlte/dist/img/AdminLTELogo.png',
            'alt' => 'AdminLTE Preloader Image',
            'effect' => 'animation__shake',
            'width' => 60,
            'height' => 60,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | User Menu
    |--------------------------------------------------------------------------
    |
    | Here you can activate and change the user menu.
    |
    | For detailed instructions you can look the user menu section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'usermenu_enabled' => true,
    'usermenu_header' => true,
    'usermenu_header_class' => 'bg-primary',
    'usermenu_image' => true,
    'usermenu_desc' => true,
    'usermenu_profile_url' => true,

    /*
    |--------------------------------------------------------------------------
    | Layout
    |--------------------------------------------------------------------------
    |
    | Here we change the layout of your admin panel.
    |
    | For detailed instructions you can look the layout section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Layout-and-Styling-Configuration
    |
    */

    'layout_topnav' => null,
    'layout_boxed' => null,
    'layout_fixed_sidebar' => true,
    'layout_fixed_navbar' => null,
    'layout_fixed_footer' => null,
    'layout_dark_mode' => true,

    /*
    |--------------------------------------------------------------------------
    | Authentication Views Classes
    |--------------------------------------------------------------------------
    |
    | Here you can change the look and behavior of the authentication views.
    |
    | For detailed instructions you can look the auth classes section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Layout-and-Styling-Configuration
    |
    */

    'classes_auth_card' => 'card-outline card-primary',
    'classes_auth_header' => '',
    'classes_auth_body' => '',
    'classes_auth_footer' => '',
    'classes_auth_icon' => '',
    'classes_auth_btn' => 'btn-flat btn-primary',

    /*
    |--------------------------------------------------------------------------
    | Admin Panel Classes
    |--------------------------------------------------------------------------
    |
    | Here you can change the look and behavior of the admin panel.
    |
    | For detailed instructions you can look the admin panel classes here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Layout-and-Styling-Configuration
    |
    */

    'classes_body' => '',
    'classes_brand' => '',
    'classes_brand_text' => '',
    'classes_content_wrapper' => '',
    'classes_content_header' => '',
    'classes_content' => '',
    'classes_sidebar' => 'sidebar-dark-primary elevation-4',
    'classes_sidebar_nav' => '',
    'classes_topnav' => 'navbar-white navbar-light',
    'classes_topnav_nav' => 'navbar-expand',
    'classes_topnav_container' => 'container',

    /*
    |--------------------------------------------------------------------------
    | Sidebar
    |--------------------------------------------------------------------------
    |
    | Here we can modify the sidebar of the admin panel.
    |
    | For detailed instructions you can look the sidebar section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Layout-and-Styling-Configuration
    |
    */

    'sidebar_mini' => 'lg',
    'sidebar_collapse' => false,
    'sidebar_collapse_auto_size' => false,
    'sidebar_collapse_remember' => false,
    'sidebar_collapse_remember_no_transition' => true,
    'sidebar_scrollbar_theme' => 'os-theme-light',
    'sidebar_scrollbar_auto_hide' => 'l',
    'sidebar_nav_accordion' => true,
    'sidebar_nav_animation_speed' => 300,

    /*
    |--------------------------------------------------------------------------
    | Control Sidebar (Right Sidebar)
    |--------------------------------------------------------------------------
    |
    | Here we can modify the right sidebar aka control sidebar of the admin panel.
    |
    | For detailed instructions you can look the right sidebar section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Layout-and-Styling-Configuration
    |
    */

    'right_sidebar' => false,
    'right_sidebar_icon' => 'fas fa-cogs',
    'right_sidebar_theme' => 'dark',
    'right_sidebar_slide' => true,
    'right_sidebar_push' => true,
    'right_sidebar_scrollbar_theme' => 'os-theme-light',
    'right_sidebar_scrollbar_auto_hide' => 'l',

    /*
    |--------------------------------------------------------------------------
    | URLs
    |--------------------------------------------------------------------------
    |
    | Here we can modify the url settings of the admin panel.
    |
    | For detailed instructions you can look the urls section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Basic-Configuration
    |
    */

    'use_route_url' => false,
    'dashboard_url' => 'welcome',
    'logout_url' => 'logout',
    'login_url' => 'login',
    'register_url' => 'register',
    'password_reset_url' => 'password/reset',
    'password_email_url' => 'password/email',
    'profile_url' => false,

    /*
    |--------------------------------------------------------------------------
    | Laravel Mix
    |--------------------------------------------------------------------------
    |
    | Here we can enable the Laravel Mix option for the admin panel.
    |
    | For detailed instructions you can look the laravel mix section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Other-Configuration
    |
    */

    'enabled_laravel_mix' => false,
    'laravel_mix_css_path' => 'css/app.css',
    'laravel_mix_js_path' => 'js/app.js',

    /*
    |--------------------------------------------------------------------------
    | Menu Items
    |--------------------------------------------------------------------------
    |
    | Here we can modify the sidebar/top navigation of the admin panel.
    |
    | For detailed instructions you can look here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Menu-Configuration
    |
    */

    'menu' => [
        //Navbar items:
        [
            'type'         => 'darkmode-widget',
            'topnav_right' => true,
            'icon-enabled' => 'fas fa-moon',
            'icon-disabled' => 'fas fa-sun',
            'color-enabled' => 'white',
            'color-disabled' => 'yellow',

        ],
        [
            'header'   => 'Configuración de Cuenta',
            'classes'  => 'text-dark text-bold text-center text-uppercase',
        ],

        [
            'type'         => 'navbar-search',
            'text'         => 'search',
            'topnav_right' => true,
        ],


        //datos del usuario y que cierre sesion



        // Sidebar items:

        [
            'header' => 'Abastecimiento',
            'classes'  => 'text-primary  text-bold text-start text-uppercase',

        ],
        [
            'text' => 'Dashboard',
            'route'  => 'dasboard.abastecimiento'
        ],
        [
            'text'    => 'Productos',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Producto',
                    'route'  => 'productos.create',
                ],
                [
                    'text' => 'Listar Productos',
                    'route'  => 'productos.index',
                ],
            ],
        ],
        [
            'text'    => 'Categoria',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Categoria',
                    'route'  => 'tipoproductos.create',
                ],
                [
                    'text' => 'Listar Categorias',
                    'route'  => 'tipoproductos.index',
                ],
            ],
        ],
        [
            'text'    => 'Unidades de Medida',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear unidad de medida',
                    'route'  => 'unidadmedidas.create',
                ],
                [
                    'text' => 'Listar unidades de medida',
                    'route'  => 'unidadmedidas.index',
                ],
            ],
        ],
        // [
        //     'text'    => 'Solicitudes',
        //     'icon'    => 'fas fa-fw fa-share',
        //     'submenu' => [

        //         [
        //             'text' => 'Solicitudes de Productos',
        //             'route'  => 'default',
        //         ],
        //     ],
        // ],
        [
            'header' => 'Compras',
            'classes'  => 'text-secondary  text-bold text-start text-uppercase',
        ],
        [
            'text' => 'Dashboard',
            'route'  => 'dasboard.compras'
        ],

        // [
        //     'text'    => 'Solicitudes Aprobadas',
        //     'icon'    => 'fas fa-fw fa-share',
        //     'submenu' => [
        //         [
        //             'text' => 'Listar Productos',
        //             'route' => 'default',
        //         ],
        //     ],
        // ],

        [
            'text'    => 'Proveedor',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar Proveedor',
                    'route'  => 'proveedores.index',
                ],
                [
                    'text' => 'Crear Proveedor',
                    'route'  => 'proveedores.create',
                ],
            ],
        ],
        [
            'text'    => 'Compras',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar Compras',
                    'route'  => 'compras.index',
                ],
                [
                    'text' => 'Crear Compras',
                    'route'  => 'compras.create',
                ],
            ],
        ],
        [
            'header' => 'Finanzas',
            'classes'  => 'text-success  text-bold text-start text-uppercase',
        ],

        [
            'text' => 'Dashboard',
            'route'  => 'dasboard.finanzas'
        ],

        [
            'text'    => 'Ingresos y Egresos',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar Ingresos y Egresos',
                    'route' => 'documentos.index',
                ],
            ],
        ],

        [
            'text'    => 'documentos contables',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar Documentos',
                    'route'  => 'tipodocumentos.index',
                ],
                [
                    'text' => 'Crear Documentos',
                    'route'  => 'tipodocumentos.create',
                ],
            ],
        ],
        // [
        //     'text'    => 'Solicitudes',
        //     'icon'    => 'fas fa-fw fa-share',
        //     'submenu' => [
        //         [
        //             'text' => 'Listar Solicitudes',
        //             'route' => 'default',
        //         ],
        //     ],
        // ],
        [
            'text'    => 'Tipos de pago',

            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar metodod de pago',
                    'route'  => 'tipopagos.index',
                ],
                [
                    'text' => 'Crear metodod de pago',
                    'route'  => 'tipopagos.create',
                ],
            ],
        ],
        [
            'text'    => 'Metodos de pago',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Listar Comprobantes',
                    'route'  => 'tipocomprobantes.index',
                ],
                [
                    'text' => 'Crear Comprobantes',
                    'route'  => 'tipocomprobantes.create',
                ],
            ],
        ],

        [
            'header' => 'Ventas',
            'classes'  => 'text-yellow text-bold text-start text-uppercase',
        ],
        [
            'text' => 'Dashboard',
            'route'  => 'dasboard.ventas'
        ],

        [
            'text'    => 'Ventas',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Venta',
                    'route'  => 'ventas.create',
                ],
                [
                    'text' => 'Listar Ventas',
                    'route'  => 'ventas.index',
                ],
            ],
        ],


        [
            'header' => 'Usuarios',
            'classes'  => 'text-dark  text-bold text-start text-uppercase',
        ],
        [
            'text'    => 'Empleados',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Empleado',
                    'route'  => 'empleados.create',
                ],
                [
                    'text' => 'Listar Empleados',
                    'route'  => 'empleados.index',
                ],
            ],
        ],

        [
            'text'    => 'Roles',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Rol',
                    'route'  => 'roles.create',
                ],
                [
                    'text' => 'Listar Roles',
                    'route'  => 'roles.index',
                ],
            ],
        ],

        [
            'text'    => 'Permisos',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                // [
                //     'text' => 'Crear Permiso',
                //     'route'  => 'permisos.create',
                // ],
                [
                    'text' => 'Listar Permisos',
                    'route'  => 'permisos.index',
                ],
            ],
        ],

        [
            'header' => 'Seguridad',
            'classes'  => 'text-info  text-bold text-start text-uppercase',
        ],
        [
            'text' => 'Dashboard',
            'route'  => 'dasboard.seguridad'
        ],
        [
            'text'    => 'Capacitaciones',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear Capacitacion',
                    'route'  => 'capacitaciones.create',
                ],
                [
                    'text' => 'Listar Capacitaciones',
                    'route'  => 'capacitaciones.index',
                ],
            ],
        ],
        [
            'text'    => 'Departaentos',
            'icon'    => 'fas fa-fw fa-share',
            'submenu' => [
                [
                    'text' => 'Crear departamento',
                    'route'  => 'departamentos.create',
                ],
                [
                    'text' => 'Listar departamentos',
                    'route'  => 'departamentos.index',
                ],
            ],
        ],





    ],

    /*
    |--------------------------------------------------------------------------
    | Menu Filters
    |--------------------------------------------------------------------------
    |
    | Here we can modify the menu filters of the admin panel.
    |
    | For detailed instructions you can look the menu filters section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Menu-Configuration
    |
    */

    'filters' => [
        JeroenNoten\LaravelAdminLte\Menu\Filters\GateFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\HrefFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\SearchFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\ActiveFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\ClassesFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\LangFilter::class,
        JeroenNoten\LaravelAdminLte\Menu\Filters\DataFilter::class,
    ],

    /*
    |--------------------------------------------------------------------------
    | Plugins Initialization
    |--------------------------------------------------------------------------
    |
    | Here we can modify the plugins used inside the admin panel.
    |
    | For detailed instructions you can look the plugins section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Plugins-Configuration
    |
    */

    'plugins' => [
        'Datatables' => [
            'active' => true,
            'files' => [
                [
                    'type' => 'css',
                    'asset' => false,
                    'location' => '//cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.8/af-2.6.0/b-2.4.2/b-colvis-2.4.2/b-html5-2.4.2/b-print-2.4.2/cr-1.7.0/date-1.5.1/fc-4.3.0/fh-3.4.0/kt-2.11.0/r-2.5.0/rg-1.4.1/rr-1.4.1/sc-2.3.0/sb-1.6.0/sp-2.2.0/sl-1.7.0/sr-1.3.0/datatables.min.css',
                ],
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js',
                ],
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js',
                ],
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.8/af-2.6.0/b-2.4.2/b-colvis-2.4.2/b-html5-2.4.2/b-print-2.4.2/cr-1.7.0/date-1.5.1/fc-4.3.0/fh-3.4.0/kt-2.11.0/r-2.5.0/rg-1.4.1/rr-1.4.1/sc-2.3.0/sb-1.6.0/sp-2.2.0/sl-1.7.0/sr-1.3.0/datatables.min.js',
                ],

            ],
        ],
        'Select2' => [
            'active' => false,
            'files' => [
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js',
                ],
                [
                    'type' => 'css',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.css',
                ],
            ],
        ],
        'Chartjs' => [
            'active' => true,
            'files' => [
                [
                    'type' => 'js',
                    'asset' => true,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.bundle.min.js',
                ],
            ],
        ],
        'Sweetalert2' => [
            'active' => false,
            'files' => [
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdn.jsdelivr.net/npm/sweetalert2@8',
                ],
            ],
        ],
        'Pace' => [
            'active' => false,
            'files' => [
                [
                    'type' => 'css',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/themes/blue/pace-theme-center-radar.min.css',
                ],
                [
                    'type' => 'js',
                    'asset' => false,
                    'location' => '//cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js',
                ],
            ],
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | IFrame
    |--------------------------------------------------------------------------
    |
    | Here we change the IFrame mode configuration. Note these changes will
    | only apply to the view that extends and enable the IFrame mode.
    |
    | For detailed instructions you can look the iframe mode section here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/IFrame-Mode-Configuration
    |
    */

    'iframe' => [
        'default_tab' => [
            'url' => null,
            'title' => null,
        ],
        'buttons' => [
            'close' => true,
            'close_all' => true,
            'close_all_other' => true,
            'scroll_left' => true,
            'scroll_right' => true,
            'fullscreen' => true,
        ],
        'options' => [
            'loading_screen' => 1000,
            'auto_show_new_tab' => true,
            'use_navbar_items' => true,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Livewire
    |--------------------------------------------------------------------------
    |
    | Here we can enable the Livewire support.
    |
    | For detailed instructions you can look the livewire here:
    | https://github.com/jeroennoten/Laravel-AdminLTE/wiki/Other-Configuration
    |
    */

    'livewire' => false,
];
