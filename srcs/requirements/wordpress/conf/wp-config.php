<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'asgard' );

/** Database username */
define( 'DB_USER', 'rsiebert' );

/** Database password */
define( 'DB_PASSWORD', 'fortytwo' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'k$]-A<]KD&,`jh30]h}Nj~:<8LUI29=4(mkh>R75U(^+*3b0|^eR)eOe2-rU#=a8' );
define( 'SECURE_AUTH_KEY',  'bFl74tzB<w)j}-L]~}-6_])wYDvEf|:j6unH+&*ogXYgM[>kt@FKfd`0&lIguX)H' );
define( 'LOGGED_IN_KEY',    'U|HwXW2Uv]D.y=HVJgSuKFpdjERl/b+`z}CQ^1r!F*!-$|fw!QI(3]RZ|&{2LzdG' );
define( 'NONCE_KEY',        ':D[~% {oc})%Bq=8,QSK8u<7Act7ga`,!DEDVLc%:%|]3!1~[+&ohrG)!Kwe#z>8' );
define( 'AUTH_SALT',        'e!dWy#cXyc{KS{O.v[YBV)s^/D(eudJdGf3WibVTfFpdf!|DO+a[-V>+g0Ll[}(,' );
define( 'SECURE_AUTH_SALT', 'KTHiYY<.X[a{*(5O{Ama/|t~yV|hS[uZuOALbV4<sWIQjsTZB.Y*EvC5u Su.#oE' );
define( 'LOGGED_IN_SALT',   'Qs{f880}N>}eB^|&$zg^vilfy[E 6gp4#aqB8)3E~]93-|hAu+p|rdd{H=ILH>VF' );
define( 'NONCE_SALT',       '&B|Iq)RN,U{++%>jHkxenR%~1v<>HAf{r-ReUBNw`3KG.9{OgzFs^G.X!&6K>d &' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
