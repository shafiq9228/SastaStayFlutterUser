# Keep GetX core classes
-keep class io.fotoapparat.** { *; }

# Keep GetX-related classes
-keep class com.getcapacitor.** { *; }
-keep class com.getx.** { *; }
-keep class com.github.getx.** { *; }

# Keep all annotations
-keepattributes *Annotation*

# Prevent warnings
-dontwarn io.fotoapparat.**
-dontwarn com.getx.**
-dontwarn com.github.getx.**

-keep class com.razorpay.** { *; }
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.PaymentsClient
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.Wallet
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.WalletUtils
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers

-keep class me.carda.awesome_notifications.** { *; }
-dontwarn me.carda.awesome_notifications.**

-keep class com.google.j2objc.annotations.** { *; }
-dontwarn com.google.j2objc.annotations.**


#keep JSON classes
-keep class * extends com.applozic.mobicommons.json.JsonMarker {
    !static !transient <fields>;
}

-keepclassmembernames class * extends com.applozic.mobicommons.json.JsonParcelableMarker {
    !static !transient <fields>;
}

#GSON Config
-keepattributes Signature
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.examples.android.model.** { *; }
-keep class org.eclipse.paho.client.mqttv3.logging.JSR47Logger { *; }
-keep class android.support.** { *; }
-keep interface android.support.** { *; }
-dontwarn android.support.v4.**
-keep public class com.google.android.gms.* { public *; }
-dontwarn com.google.android.gms.**
-keep class com.google.gson.** { *; }
-keep class net.sqlcipher.** { *; }
-keep class javax.crypto.** { *; }
-keep class net.zetetic.database.sqlcipher.* { *; }
-keep class net.zetetic.database.sqlcipher.** { *; }
-keepattributes *Annotation*
-keep class io.kommunicate.** { *; }
-dontwarn io.kommunicate.**
-keep class io.kommunicate.ui.** { *; }
-dontwarn io.kommunicate.ui.**
