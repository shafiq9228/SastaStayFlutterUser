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
