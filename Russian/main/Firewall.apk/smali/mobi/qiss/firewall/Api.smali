.class public final Lmobi/qiss/firewall/Api;
.super Ljava/lang/Object;
.source "Api.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmobi/qiss/firewall/Api$ScriptRunner;,
        Lmobi/qiss/firewall/Api$DroidApp;
    }
.end annotation


# static fields
.field public static applications:[Lmobi/qiss/firewall/Api$DroidApp;

.field private static hasroot:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    sput-object v0, Lmobi/qiss/firewall/Api;->applications:[Lmobi/qiss/firewall/Api$DroidApp;

    .line 65
    const/4 v0, 0x0

    sput-boolean v0, Lmobi/qiss/firewall/Api;->hasroot:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 941
    return-void
.end method

.method public static alert(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "ctx"
    .parameter "msg"

    .prologue
    .line 73
    if-eqz p0, :cond_0

    .line 74
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 79
    :cond_0
    return-void
.end method

.method public static applicationRemoved(Landroid/content/Context;I)V
    .locals 12
    .parameter
    .parameter

    .prologue
    const/16 v11, 0x7c

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 834
    const-string v0, "DroidWallPrefs"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 835
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 837
    const-string v4, "AllowedUidsWifi"

    const-string v5, ""

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 838
    const-string v5, "AllowedUids3G"

    const-string v6, ""

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 839
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 842
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_9

    .line 843
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 844
    new-instance v8, Ljava/util/StringTokenizer;

    const-string v0, "|"

    invoke-direct {v8, v4, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    .line 845
    :goto_0
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 846
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 847
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 848
    const-string v0, "Firewall"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Removing UID "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, " from the wi-fi list (package removed)!"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 849
    goto :goto_0

    .line 851
    :cond_0
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-lez v9, :cond_1

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 852
    :cond_1
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 855
    :cond_2
    if-eqz v0, :cond_3

    .line 856
    const-string v4, "AllowedUidsWifi"

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v4, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 860
    :cond_3
    :goto_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_7

    .line 861
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 862
    new-instance v7, Ljava/util/StringTokenizer;

    const-string v8, "|"

    invoke-direct {v7, v5, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 863
    :goto_2
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 864
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 865
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 866
    const-string v0, "Firewall"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Removing UID "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " from the 3G list (package removed)!"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 867
    goto :goto_2

    .line 869
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_5

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 870
    :cond_5
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 873
    :cond_6
    if-eqz v0, :cond_7

    .line 874
    const-string v2, "AllowedUids3G"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 878
    :cond_7
    if-eqz v0, :cond_8

    .line 879
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 880
    invoke-static {p0}, Lmobi/qiss/firewall/Api;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 882
    invoke-static {p0, v1}, Lmobi/qiss/firewall/Api;->applySavedIptablesRules(Landroid/content/Context;Z)Z

    .line 885
    :cond_8
    return-void

    :cond_9
    move v0, v1

    goto :goto_1
.end method

.method public static applyIptablesRules(Landroid/content/Context;Z)Z
    .locals 1
    .parameter "ctx"
    .parameter "showErrors"

    .prologue
    .line 356
    if-nez p0, :cond_0

    .line 357
    const/4 v0, 0x0

    .line 360
    :goto_0
    return v0

    .line 359
    :cond_0
    invoke-static {p0}, Lmobi/qiss/firewall/Api;->saveRules(Landroid/content/Context;)V

    .line 360
    invoke-static {p0, p1}, Lmobi/qiss/firewall/Api;->applySavedIptablesRules(Landroid/content/Context;Z)Z

    move-result v0

    goto :goto_0
.end method

.method private static applyIptablesRulesImpl(Landroid/content/Context;Ljava/util/List;Ljava/util/List;Z)Z
    .locals 26
    .parameter "ctx"
    .parameter
    .parameter
    .parameter "showErrors"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;Z)Z"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, uidsWifi:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, uids3g:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez p0, :cond_0

    .line 156
    const/16 v23, 0x0

    .line 304
    :goto_0
    return v23

    .line 158
    :cond_0
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-static {v0, v1}, Lmobi/qiss/firewall/Api;->assertBinaries(Landroid/content/Context;Z)Z

    .line 159
    const/16 v23, 0x4

    move/from16 v0, v23

    new-array v4, v0, [Ljava/lang/String;

    const/16 v23, 0x0

    const-string v24, "tiwlan+"

    aput-object v24, v4, v23

    const/16 v23, 0x1

    const-string v24, "wlan+"

    aput-object v24, v4, v23

    const/16 v23, 0x2

    const-string v24, "eth+"

    aput-object v24, v4, v23

    const/16 v23, 0x3

    const-string v24, "ra+"

    aput-object v24, v4, v23

    .line 160
    .local v4, ITFS_WIFI:[Ljava/lang/String;
    const/16 v23, 0x7

    move/from16 v0, v23

    new-array v3, v0, [Ljava/lang/String;

    const/16 v23, 0x0

    const-string v24, "rmnet+"

    aput-object v24, v3, v23

    const/16 v23, 0x1

    const-string v24, "pdp+"

    aput-object v24, v3, v23

    const/16 v23, 0x2

    const-string v24, "ppp+"

    aput-object v24, v3, v23

    const/16 v23, 0x3

    const-string v24, "uwbr+"

    aput-object v24, v3, v23

    const/16 v23, 0x4

    const-string v24, "wimax+"

    aput-object v24, v3, v23

    const/16 v23, 0x5

    const-string v24, "vsnet+"

    aput-object v24, v3, v23

    const/16 v23, 0x6

    const-string v24, "ccmni+"

    aput-object v24, v3, v23

    .line 161
    .local v3, ITFS_3G:[Ljava/lang/String;
    const-string v23, "DroidWallPrefs"

    const/16 v24, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 162
    .local v17, prefs:Landroid/content/SharedPreferences;
    const-string v23, "BlockMode"

    const-string v24, "whitelist"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const-string v24, "whitelist"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    .line 163
    .local v22, whitelist:Z
    if-nez v22, :cond_3

    const/4 v8, 0x1

    .line 164
    .local v8, blacklist:Z
    :goto_1
    const-string v23, "DroidWallPrefs"

    const/16 v24, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v23

    const-string v24, "LogEnabled"

    const/16 v25, 0x0

    invoke-interface/range {v23 .. v25}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v15

    .line 165
    .local v15, logenabled:Z
    const-string v23, "DroidWallPrefs"

    const/16 v24, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v23

    const-string v24, "CustomScript"

    const-string v25, ""

    invoke-interface/range {v23 .. v25}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 167
    .local v10, customScript:Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v19, script:Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static/range {p0 .. p0}, Lmobi/qiss/firewall/Api;->scriptHeader(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const-string v23, "$IPTABLES --version || exit 1\n# Create the droidwall chains if necessary\n$IPTABLES -L droidwall >/dev/null 2>/dev/null || $IPTABLES --new droidwall || exit 2\n$IPTABLES -L droidwall-3g >/dev/null 2>/dev/null || $IPTABLES --new droidwall-3g || exit 3\n$IPTABLES -L droidwall-wifi >/dev/null 2>/dev/null || $IPTABLES --new droidwall-wifi || exit 4\n$IPTABLES -L droidwall-reject >/dev/null 2>/dev/null || $IPTABLES --new droidwall-reject || exit 5\n# Add droidwall chain to OUTPUT chain if necessary\n$IPTABLES -L OUTPUT | $GREP -q droidwall || $IPTABLES -A OUTPUT -j droidwall || exit 6\n# Flush existing rules\n$IPTABLES -F droidwall || exit 7\n$IPTABLES -F droidwall-3g || exit 8\n$IPTABLES -F droidwall-wifi || exit 9\n$IPTABLES -F droidwall-reject || exit 10\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    if-eqz v15, :cond_4

    .line 188
    const-string v23, "# Create the log and reject rules (ignore errors on the LOG target just in case it is not available)\n$IPTABLES -A droidwall-reject -j LOG --log-prefix \"[DROIDWALL] \" --log-uid\n$IPTABLES -A droidwall-reject -j REJECT || exit 11\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    :goto_2
    if-eqz v10, :cond_1

    .line 201
    const-string v23, "\n# BEGIN OF CUSTOM SCRIPT (user-defined)\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    const-string v23, "$IPTABLES -D OUTPUT -j droidwall\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    const-string v23, "$IPTABLES -I OUTPUT 2 -j droidwall\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    const-string v23, "\n# END OF CUSTOM SCRIPT (user-defined)\n\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    :cond_1
    if-eqz v22, :cond_2

    if-eqz v15, :cond_2

    .line 209
    const-string v23, "# Allow DNS lookups on white-list for a better logging (ignore errors)\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    const-string v23, "$IPTABLES -A droidwall -p udp --dport 53 -j RETURN\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    :cond_2
    const-string v23, "# Main rules (per interface)\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    move-object v7, v3

    .local v7, arr$:[Ljava/lang/String;
    array-length v14, v7

    .local v14, len$:I
    const/4 v12, 0x0

    .local v12, i$:I
    :goto_3
    if-ge v12, v14, :cond_6

    aget-object v13, v7, v12

    .line 214
    .local v13, itf:Ljava/lang/String;
    const-string v23, "$IPTABLES -A droidwall -o "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j droidwall-3g || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 163
    .end local v7           #arr$:[Ljava/lang/String;
    .end local v8           #blacklist:Z
    .end local v10           #customScript:Ljava/lang/String;
    .end local v12           #i$:I
    .end local v13           #itf:Ljava/lang/String;
    .end local v14           #len$:I
    .end local v15           #logenabled:Z
    .end local v19           #script:Ljava/lang/StringBuilder;
    :cond_3
    const/4 v8, 0x0

    goto/16 :goto_1

    .line 194
    .restart local v8       #blacklist:Z
    .restart local v10       #customScript:Ljava/lang/String;
    .restart local v15       #logenabled:Z
    .restart local v19       #script:Ljava/lang/StringBuilder;
    :cond_4
    const-string v23, "# Create the reject rule (log disabled)\n$IPTABLES -A droidwall-reject -j REJECT || exit 11\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 301
    :catch_0
    move-exception v11

    .line 302
    .local v11, e:Ljava/lang/Exception;
    if-eqz p3, :cond_5

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "error refreshing iptables: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 304
    .end local v11           #e:Ljava/lang/Exception;
    :cond_5
    :goto_4
    const/16 v23, 0x0

    goto/16 :goto_0

    .line 216
    .restart local v7       #arr$:[Ljava/lang/String;
    .restart local v12       #i$:I
    .restart local v14       #len$:I
    :cond_6
    move-object v7, v4

    :try_start_1
    array-length v14, v7

    const/4 v12, 0x0

    :goto_5
    if-ge v12, v14, :cond_7

    aget-object v13, v7, v12

    .line 217
    .restart local v13       #itf:Ljava/lang/String;
    const-string v23, "$IPTABLES -A droidwall -o "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j droidwall-wifi || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 220
    .end local v13           #itf:Ljava/lang/String;
    :cond_7
    const-string v23, "# Filtering rules\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    if-eqz v22, :cond_f

    const-string v20, "RETURN"

    .line 222
    .local v20, targetRule:Ljava/lang/String;
    :goto_6
    const/16 v23, -0xa

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_10

    const/4 v5, 0x1

    .line 223
    .local v5, any_3g:Z
    :goto_7
    const/16 v23, -0xa

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_11

    const/4 v6, 0x1

    .line 224
    .local v6, any_wifi:Z
    :goto_8
    if-eqz v22, :cond_9

    if-nez v6, :cond_9

    .line 226
    const-string v23, "dhcp"

    invoke-static/range {v23 .. v23}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v21

    .line 227
    .local v21, uid:I
    const/16 v23, -0x1

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_8

    .line 228
    const-string v23, "# dhcp user\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const-string v23, "$IPTABLES -A droidwall-wifi -m owner --uid-owner "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j RETURN || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    :cond_8
    const-string v23, "wifi"

    invoke-static/range {v23 .. v23}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v21

    .line 232
    const/16 v23, -0x1

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_9

    .line 233
    const-string v23, "# wifi user\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    const-string v23, "$IPTABLES -A droidwall-wifi -m owner --uid-owner "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j RETURN || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .end local v21           #uid:I
    :cond_9
    if-eqz v5, :cond_12

    .line 238
    if-eqz v8, :cond_a

    .line 240
    const-string v23, "$IPTABLES -A droidwall-3g -j "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .end local v12           #i$:I
    :cond_a
    if-eqz v6, :cond_14

    .line 249
    if-eqz v8, :cond_b

    .line 251
    const-string v23, "$IPTABLES -A droidwall-wifi -j "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    :cond_b
    if-eqz v22, :cond_18

    .line 260
    if-nez v5, :cond_c

    .line 261
    const/16 v23, -0xb

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_16

    .line 262
    const-string v23, "# hack to allow kernel packets on white-list\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    const-string v23, "$IPTABLES -A droidwall-3g -m owner --uid-owner 0:999999999 -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    :cond_c
    :goto_9
    if-nez v6, :cond_d

    .line 269
    const/16 v23, -0xb

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_17

    .line 270
    const-string v23, "# hack to allow kernel packets on white-list\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    const-string v23, "$IPTABLES -A droidwall-wifi -m owner --uid-owner 0:999999999 -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    :cond_d
    :goto_a
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .local v18, res:Ljava/lang/StringBuilder;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lmobi/qiss/firewall/Api;->runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v9

    .line 290
    .local v9, code:I
    if-eqz p3, :cond_1a

    if-eqz v9, :cond_1a

    .line 291
    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 292
    .local v16, msg:Ljava/lang/String;
    const-string v23, "DroidWall"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const-string v23, "\nTry `iptables -h\' or \'iptables --help\' for more information."

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v23

    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_e

    .line 295
    const-string v23, "\nTry `iptables -h\' or \'iptables --help\' for more information."

    const-string v24, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v16

    .line 297
    :cond_e
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error applying iptables rules. Exit code: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\n\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 221
    .end local v5           #any_3g:Z
    .end local v6           #any_wifi:Z
    .end local v9           #code:I
    .end local v16           #msg:Ljava/lang/String;
    .end local v18           #res:Ljava/lang/StringBuilder;
    .end local v20           #targetRule:Ljava/lang/String;
    .restart local v12       #i$:I
    :cond_f
    const-string v20, "droidwall-reject"

    goto/16 :goto_6

    .line 222
    .restart local v20       #targetRule:Ljava/lang/String;
    :cond_10
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 223
    .restart local v5       #any_3g:Z
    :cond_11
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 244
    .restart local v6       #any_wifi:Z
    :cond_12
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, i$:Ljava/util/Iterator;
    :cond_13
    :goto_b
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    .line 245
    .local v21, uid:Ljava/lang/Integer;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v23

    if-ltz v23, :cond_13

    const-string v23, "$IPTABLES -A droidwall-3g -m owner --uid-owner "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 255
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v21           #uid:Ljava/lang/Integer;
    :cond_14
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .restart local v12       #i$:Ljava/util/Iterator;
    :cond_15
    :goto_c
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_b

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    .line 256
    .restart local v21       #uid:Ljava/lang/Integer;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v23

    if-ltz v23, :cond_15

    const-string v23, "$IPTABLES -A droidwall-wifi -m owner --uid-owner "

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " -j "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " || exit\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 265
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v21           #uid:Ljava/lang/Integer;
    :cond_16
    const-string v23, "$IPTABLES -A droidwall-3g -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_9

    .line 273
    :cond_17
    const-string v23, "$IPTABLES -A droidwall-wifi -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 277
    :cond_18
    const/16 v23, -0xb

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_19

    .line 278
    const-string v23, "# hack to BLOCK kernel packets on black-list\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    const-string v23, "$IPTABLES -A droidwall-3g -m owner --uid-owner 0:999999999 -j RETURN || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    const-string v23, "$IPTABLES -A droidwall-3g -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    :cond_19
    const/16 v23, -0xb

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v23

    if-ltz v23, :cond_d

    .line 283
    const-string v23, "# hack to BLOCK kernel packets on black-list\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    const-string v23, "$IPTABLES -A droidwall-wifi -m owner --uid-owner 0:999999999 -j RETURN || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    const-string v23, "$IPTABLES -A droidwall-wifi -j droidwall-reject || exit\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_a

    .line 299
    .restart local v9       #code:I
    .restart local v18       #res:Ljava/lang/StringBuilder;
    :cond_1a
    const/16 v23, 0x1

    goto/16 :goto_0
.end method

.method public static applySavedIptablesRules(Landroid/content/Context;Z)Z
    .locals 9
    .parameter "ctx"
    .parameter "showErrors"

    .prologue
    const/4 v7, 0x0

    .line 313
    if-nez p0, :cond_0

    .line 347
    :goto_0
    return v7

    .line 316
    :cond_0
    const-string v8, "DroidWallPrefs"

    invoke-virtual {p0, v8, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 317
    .local v0, prefs:Landroid/content/SharedPreferences;
    const-string v7, "AllowedUidsWifi"

    const-string v8, ""

    invoke-interface {v0, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, savedUids_wifi:Ljava/lang/String;
    const-string v7, "AllowedUids3G"

    const-string v8, ""

    invoke-interface {v0, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 319
    .local v1, savedUids_3g:Ljava/lang/String;
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 320
    .local v6, uids_wifi:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 322
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v7, "|"

    invoke-direct {v3, v2, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    .local v3, tok:Ljava/util/StringTokenizer;
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 324
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 325
    .local v4, uid:Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 327
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 328
    :catch_0
    move-exception v7

    goto :goto_1

    .line 333
    .end local v3           #tok:Ljava/util/StringTokenizer;
    .end local v4           #uid:Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 334
    .local v5, uids_3g:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_4

    .line 336
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v7, "|"

    invoke-direct {v3, v1, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .restart local v3       #tok:Ljava/util/StringTokenizer;
    :cond_3
    :goto_2
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 338
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 339
    .restart local v4       #uid:Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 341
    :try_start_1
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 342
    :catch_1
    move-exception v7

    goto :goto_2

    .line 347
    .end local v3           #tok:Ljava/util/StringTokenizer;
    .end local v4           #uid:Ljava/lang/String;
    :cond_4
    invoke-static {p0, v6, v5, p1}, Lmobi/qiss/firewall/Api;->applyIptablesRulesImpl(Landroid/content/Context;Ljava/util/List;Ljava/util/List;Z)Z

    move-result v7

    goto :goto_0
.end method

.method public static assertBinaries(Landroid/content/Context;Z)Z
    .locals 7
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 772
    .line 775
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "bin"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    const-string v4, "iptables_armv5"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 776
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/32 v5, 0x307fc

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    .line 777
    :cond_0
    const v3, 0x7f040001

    const-string v4, "755"

    invoke-static {p0, v3, v2, v4}, Lmobi/qiss/firewall/Api;->copyRawFile(Landroid/content/Context;ILjava/io/File;Ljava/lang/String;)V

    move v2, v0

    .line 781
    :goto_0
    new-instance v3, Ljava/io/File;

    const-string v4, "bin"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v4

    const-string v5, "busybox_g1"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 782
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 783
    const/high16 v2, 0x7f04

    const-string v4, "755"

    invoke-static {p0, v2, v3, v4}, Lmobi/qiss/firewall/Api;->copyRawFile(Landroid/content/Context;ILjava/io/File;Ljava/lang/String;)V

    move v2, v0

    .line 786
    :cond_1
    if-eqz v2, :cond_2

    .line 787
    const v2, 0x7f050009

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 793
    :cond_2
    :goto_1
    return v0

    .line 789
    :catch_0
    move-exception v0

    .line 790
    if-eqz p1, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error installing binary files: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_3
    move v0, v1

    .line 791
    goto :goto_1

    :cond_4
    move v2, v1

    goto :goto_0
.end method

.method private static copyRawFile(Landroid/content/Context;ILjava/io/File;Ljava/lang/String;)V
    .locals 8
    .parameter "ctx"
    .parameter "resid"
    .parameter "file"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, abspath:Ljava/lang/String;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 136
    .local v4, out:Ljava/io/FileOutputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 137
    .local v2, is:Ljava/io/InputStream;
    const/16 v5, 0x400

    new-array v1, v5, [B

    .line 139
    .local v1, buf:[B
    :goto_0
    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, len:I
    if-lez v3, :cond_0

    .line 140
    const/4 v5, 0x0

    invoke-virtual {v4, v1, v5, v3}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 143
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 145
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "chmod "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    .line 146
    return-void
.end method

.method public static getApps(Landroid/content/Context;)[Lmobi/qiss/firewall/Api$DroidApp;
    .locals 33
    .parameter "ctx"

    .prologue
    .line 556
    sget-object v27, Lmobi/qiss/firewall/Api;->applications:[Lmobi/qiss/firewall/Api$DroidApp;

    if-eqz v27, :cond_0

    .line 558
    sget-object v27, Lmobi/qiss/firewall/Api;->applications:[Lmobi/qiss/firewall/Api$DroidApp;

    .line 675
    :goto_0
    return-object v27

    .line 560
    :cond_0
    const-string v27, "DroidWallPrefs"

    const/16 v28, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v19

    .line 562
    .local v19, prefs:Landroid/content/SharedPreferences;
    const-string v27, "AllowedUidsWifi"

    const-string v28, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 563
    .local v21, savedUids_wifi:Ljava/lang/String;
    const-string v27, "AllowedUids3G"

    const-string v28, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 564
    .local v20, savedUids_3g:Ljava/lang/String;
    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 565
    .local v23, selected_wifi:[I
    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v22, v0

    .line 566
    .local v22, selected_3g:[I
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v27

    if-lez v27, :cond_3

    .line 568
    new-instance v25, Ljava/util/StringTokenizer;

    const-string v27, "|"

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    .local v25, tok:Ljava/util/StringTokenizer;
    invoke-virtual/range {v25 .. v25}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v27

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 570
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v12, v0, :cond_2

    .line 571
    invoke-virtual/range {v25 .. v25}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v26

    .line 572
    .local v26, uid:Ljava/lang/String;
    const-string v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1

    .line 574
    :try_start_0
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v27

    aput v27, v23, v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 570
    :cond_1
    :goto_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 575
    :catch_0
    move-exception v11

    .line 576
    .local v11, ex:Ljava/lang/Exception;
    const/16 v27, -0x1

    aput v27, v23, v12

    goto :goto_2

    .line 581
    .end local v11           #ex:Ljava/lang/Exception;
    .end local v26           #uid:Ljava/lang/String;
    :cond_2
    invoke-static/range {v23 .. v23}, Ljava/util/Arrays;->sort([I)V

    .line 583
    .end local v12           #i:I
    .end local v25           #tok:Ljava/util/StringTokenizer;
    :cond_3
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v27

    if-lez v27, :cond_6

    .line 585
    new-instance v25, Ljava/util/StringTokenizer;

    const-string v27, "|"

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    .restart local v25       #tok:Ljava/util/StringTokenizer;
    invoke-virtual/range {v25 .. v25}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v27

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v22, v0

    .line 587
    const/4 v12, 0x0

    .restart local v12       #i:I
    :goto_3
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v12, v0, :cond_5

    .line 588
    invoke-virtual/range {v25 .. v25}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v26

    .line 589
    .restart local v26       #uid:Ljava/lang/String;
    const-string v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_4

    .line 591
    :try_start_1
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v27

    aput v27, v22, v12
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 587
    :cond_4
    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 592
    :catch_1
    move-exception v11

    .line 593
    .restart local v11       #ex:Ljava/lang/Exception;
    const/16 v27, -0x1

    aput v27, v22, v12

    goto :goto_4

    .line 598
    .end local v11           #ex:Ljava/lang/Exception;
    .end local v26           #uid:Ljava/lang/String;
    :cond_5
    invoke-static/range {v22 .. v22}, Ljava/util/Arrays;->sort([I)V

    .line 601
    .end local v12           #i:I
    .end local v25           #tok:Ljava/util/StringTokenizer;
    :cond_6
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v18

    .line 602
    .local v18, pkgmanager:Landroid/content/pm/PackageManager;
    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v14

    .line 603
    .local v14, installed:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 604
    .local v15, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Lmobi/qiss/firewall/Api$DroidApp;>;"
    invoke-interface/range {v19 .. v19}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    .line 605
    .local v10, edit:Landroid/content/SharedPreferences$Editor;
    const/4 v8, 0x0

    .line 606
    .local v8, changed:Z
    const/16 v16, 0x0

    .line 607
    .local v16, name:Ljava/lang/String;
    const/4 v7, 0x0

    .line 608
    .local v7, cachekey:Ljava/lang/String;
    const/4 v6, 0x0

    .line 609
    .local v6, app:Lmobi/qiss/firewall/Api$DroidApp;
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :cond_7
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_c

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ApplicationInfo;

    .line 610
    .local v5, apinfo:Landroid/content/pm/ApplicationInfo;
    iget v0, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v27, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #app:Lmobi/qiss/firewall/Api$DroidApp;
    check-cast v6, Lmobi/qiss/firewall/Api$DroidApp;

    .line 612
    .restart local v6       #app:Lmobi/qiss/firewall/Api$DroidApp;
    if-nez v6, :cond_8

    const-string v27, "android.permission.INTERNET"

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v27

    if-nez v27, :cond_7

    .line 616
    :cond_8
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "cache.label."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 617
    const-string v27, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-interface {v0, v7, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 618
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v27

    if-nez v27, :cond_9

    .line 620
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 621
    move-object/from16 v0, v16

    invoke-interface {v10, v7, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 622
    const/4 v8, 0x1

    .line 624
    :cond_9
    if-nez v6, :cond_b

    .line 625
    new-instance v6, Lmobi/qiss/firewall/Api$DroidApp;

    .end local v6           #app:Lmobi/qiss/firewall/Api$DroidApp;
    invoke-direct {v6}, Lmobi/qiss/firewall/Api$DroidApp;-><init>()V

    .line 626
    .restart local v6       #app:Lmobi/qiss/firewall/Api$DroidApp;
    iget v0, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v27, v0

    move/from16 v0, v27

    iput v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    .line 627
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput-object v16, v27, v28

    move-object/from16 v0, v27

    iput-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    .line 628
    iget v0, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v27, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v15, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    :goto_6
    iget-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_wifi:Z

    move/from16 v27, v0

    if-nez v27, :cond_a

    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v27

    if-ltz v27, :cond_a

    .line 637
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_wifi:Z

    .line 639
    :cond_a
    iget-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_3g:Z

    move/from16 v27, v0

    if-nez v27, :cond_7

    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v27

    if-ltz v27, :cond_7

    .line 640
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_3g:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_5

    .line 672
    .end local v5           #apinfo:Landroid/content/pm/ApplicationInfo;
    .end local v6           #app:Lmobi/qiss/firewall/Api$DroidApp;
    .end local v7           #cachekey:Ljava/lang/String;
    .end local v8           #changed:Z
    .end local v10           #edit:Landroid/content/SharedPreferences$Editor;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #installed:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    .end local v15           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Lmobi/qiss/firewall/Api$DroidApp;>;"
    .end local v16           #name:Ljava/lang/String;
    .end local v18           #pkgmanager:Landroid/content/pm/PackageManager;
    :catch_2
    move-exception v9

    .line 673
    .local v9, e:Ljava/lang/Exception;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "error: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 675
    const/16 v27, 0x0

    goto/16 :goto_0

    .line 630
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v5       #apinfo:Landroid/content/pm/ApplicationInfo;
    .restart local v6       #app:Lmobi/qiss/firewall/Api$DroidApp;
    .restart local v7       #cachekey:Ljava/lang/String;
    .restart local v8       #changed:Z
    .restart local v10       #edit:Landroid/content/SharedPreferences$Editor;
    .restart local v13       #i$:Ljava/util/Iterator;
    .restart local v14       #installed:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    .restart local v15       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Lmobi/qiss/firewall/Api$DroidApp;>;"
    .restart local v16       #name:Ljava/lang/String;
    .restart local v18       #pkgmanager:Landroid/content/pm/PackageManager;
    :cond_b
    :try_start_3
    iget-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 631
    .local v17, newnames:[Ljava/lang/String;
    iget-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x0

    iget-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move-object/from16 v0, v27

    move/from16 v1, v28

    move-object/from16 v2, v17

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 632
    iget-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    aput-object v16, v17, v27

    .line 633
    move-object/from16 v0, v17

    iput-object v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->names:[Ljava/lang/String;

    goto/16 :goto_6

    .line 643
    .end local v5           #apinfo:Landroid/content/pm/ApplicationInfo;
    .end local v17           #newnames:[Ljava/lang/String;
    :cond_c
    if-eqz v8, :cond_d

    .line 644
    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 647
    :cond_d
    const/16 v27, 0x7

    move/from16 v0, v27

    new-array v0, v0, [Lmobi/qiss/firewall/Api$DroidApp;

    move-object/from16 v24, v0

    const/16 v27, 0x0

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const/16 v29, -0xa

    const-string v30, "(Все приложения) - Заблокировать все приложения"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x1

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const/16 v29, -0xb

    const-string v30, "(Ядро) - Ядро Linux"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x2

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const-string v29, "root"

    invoke-static/range {v29 .. v29}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v29

    const-string v30, "(Рут) - Приложения требующие права рут"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x3

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const-string v29, "media"

    invoke-static/range {v29 .. v29}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v29

    const-string v30, "Media server"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x4

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const-string v29, "vpn"

    invoke-static/range {v29 .. v29}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v29

    const-string v30, "VPN networking"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x5

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const-string v29, "shell"

    invoke-static/range {v29 .. v29}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v29

    const-string v30, "Linux shell"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    const/16 v27, 0x6

    new-instance v28, Lmobi/qiss/firewall/Api$DroidApp;

    const-string v29, "gps"

    invoke-static/range {v29 .. v29}, Landroid/os/Process;->getUidForName(Ljava/lang/String;)I

    move-result v29

    const-string v30, "GPS"

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v28 .. v32}, Lmobi/qiss/firewall/Api$DroidApp;-><init>(ILjava/lang/String;ZZ)V

    aput-object v28, v24, v27

    .line 656
    .local v24, special:[Lmobi/qiss/firewall/Api$DroidApp;
    const/4 v12, 0x0

    .restart local v12       #i:I
    :goto_7
    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v12, v0, :cond_11

    .line 657
    aget-object v6, v24, v12

    .line 658
    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    const/16 v28, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-eq v0, v1, :cond_10

    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_10

    .line 660
    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v27

    if-ltz v27, :cond_e

    .line 661
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_wifi:Z

    .line 663
    :cond_e
    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v27

    if-ltz v27, :cond_f

    .line 664
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_3g:Z

    .line 666
    :cond_f
    iget v0, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    move/from16 v27, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v15, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    :cond_10
    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    .line 670
    :cond_11
    invoke-virtual {v15}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v27

    invoke-virtual {v15}, Ljava/util/HashMap;->size()I

    move-result v28

    move/from16 v0, v28

    new-array v0, v0, [Lmobi/qiss/firewall/Api$DroidApp;

    move-object/from16 v28, v0

    invoke-interface/range {v27 .. v28}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v27

    check-cast v27, [Lmobi/qiss/firewall/Api$DroidApp;

    sput-object v27, Lmobi/qiss/firewall/Api;->applications:[Lmobi/qiss/firewall/Api$DroidApp;

    .line 671
    sget-object v27, Lmobi/qiss/firewall/Api;->applications:[Lmobi/qiss/firewall/Api$DroidApp;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0
.end method

.method public static hasRootAccess(Landroid/content/Context;Z)Z
    .locals 3
    .parameter "ctx"
    .parameter "showErrors"

    .prologue
    const/4 v1, 0x1

    .line 684
    sget-boolean v2, Lmobi/qiss/firewall/Api;->hasroot:Z

    if-eqz v2, :cond_0

    .line 700
    :goto_0
    return v1

    .line 685
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 688
    .local v0, res:Ljava/lang/StringBuilder;
    :try_start_0
    const-string v2, "exit 0"

    invoke-static {p0, v2, v0}, Lmobi/qiss/firewall/Api;->runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v2

    if-nez v2, :cond_1

    .line 689
    const/4 v2, 0x1

    sput-boolean v2, Lmobi/qiss/firewall/Api;->hasroot:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 692
    :catch_0
    move-exception v1

    .line 694
    :cond_1
    if-eqz p1, :cond_2

    .line 695
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not acquire root access.\nYou need a rooted phone to run Firewall.\n\nIf this phone is already rooted, please make sure Firewall has enough permissions to execute the \"su\" command.\nError message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 700
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .locals 3
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 801
    if-nez p0, :cond_0

    .line 802
    :goto_0
    return v0

    :cond_0
    const-string v1, "DroidWallPrefs"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "Enabled"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public static purgeIptables(Landroid/content/Context;Z)Z
    .locals 9
    .parameter "ctx"
    .parameter "showErrors"

    .prologue
    const/4 v5, 0x0

    .line 397
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 399
    .local v3, res:Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {p0, p1}, Lmobi/qiss/firewall/Api;->assertBinaries(Landroid/content/Context;Z)Z

    .line 401
    const-string v6, "DroidWallPrefs"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "CustomScript2"

    const-string v8, ""

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 402
    .local v1, customScript:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 403
    .local v4, script:Ljava/lang/StringBuilder;
    invoke-static {p0}, Lmobi/qiss/firewall/Api;->scriptHeader(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    const-string v6, "$IPTABLES -F droidwall\n$IPTABLES -F droidwall-reject\n$IPTABLES -F droidwall-3g\n$IPTABLES -F droidwall-wifi\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 411
    const-string v6, "\n# BEGIN OF CUSTOM SCRIPT (user-defined)\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    const-string v6, "\n# END OF CUSTOM SCRIPT (user-defined)\n\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6, v3}, Lmobi/qiss/firewall/Api;->runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v0

    .line 416
    .local v0, code:I
    const/4 v6, -0x1

    if-ne v0, v6, :cond_2

    .line 417
    if-eqz p1, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error purging iptables. exit code: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 423
    .end local v0           #code:I
    .end local v1           #customScript:Ljava/lang/String;
    .end local v4           #script:Ljava/lang/StringBuilder;
    :cond_1
    :goto_0
    return v5

    .line 420
    .restart local v0       #code:I
    .restart local v1       #customScript:Ljava/lang/String;
    .restart local v4       #script:Ljava/lang/StringBuilder;
    :cond_2
    const/4 v5, 0x1

    goto :goto_0

    .line 421
    .end local v0           #code:I
    .end local v1           #customScript:Ljava/lang/String;
    .end local v4           #script:Ljava/lang/StringBuilder;
    :catch_0
    move-exception v2

    .line 422
    .local v2, e:Ljava/lang/Exception;
    if-eqz p1, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error purging iptables: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public static runScript(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;JZ)I
    .locals 4
    .parameter "ctx"
    .parameter "script"
    .parameter "res"
    .parameter "timeout"
    .parameter "asroot"

    .prologue
    .line 711
    new-instance v0, Ljava/io/File;

    const-string v2, "bin"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    const-string v3, "droidwall.sh"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 712
    .local v0, file:Ljava/io/File;
    new-instance v1, Lmobi/qiss/firewall/Api$ScriptRunner;

    invoke-direct {v1, v0, p1, p2, p5}, Lmobi/qiss/firewall/Api$ScriptRunner;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    .line 713
    .local v1, runner:Lmobi/qiss/firewall/Api$ScriptRunner;
    invoke-virtual {v1}, Lmobi/qiss/firewall/Api$ScriptRunner;->start()V

    .line 715
    const-wide/16 v2, 0x0

    cmp-long v2, p3, v2

    if-lez v2, :cond_1

    .line 716
    :try_start_0
    invoke-virtual {v1, p3, p4}, Lmobi/qiss/firewall/Api$ScriptRunner;->join(J)V

    .line 720
    :goto_0
    invoke-virtual {v1}, Lmobi/qiss/firewall/Api$ScriptRunner;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 722
    invoke-virtual {v1}, Lmobi/qiss/firewall/Api$ScriptRunner;->interrupt()V

    .line 723
    const-wide/16 v2, 0x96

    invoke-virtual {v1, v2, v3}, Lmobi/qiss/firewall/Api$ScriptRunner;->join(J)V

    .line 724
    invoke-virtual {v1}, Lmobi/qiss/firewall/Api$ScriptRunner;->destroy()V

    .line 725
    const-wide/16 v2, 0x32

    invoke-virtual {v1, v2, v3}, Lmobi/qiss/firewall/Api$ScriptRunner;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 728
    :cond_0
    :goto_1
    iget v2, v1, Lmobi/qiss/firewall/Api$ScriptRunner;->exitcode:I

    return v2

    .line 718
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Lmobi/qiss/firewall/Api$ScriptRunner;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 727
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public static runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)I
    .locals 2
    .parameter "ctx"
    .parameter "script"
    .parameter "res"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 751
    const-wide/32 v0, 0x9c40

    invoke-static {p0, p1, p2, v0, v1}, Lmobi/qiss/firewall/Api;->runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;J)I

    move-result v0

    return v0
.end method

.method public static runScriptAsRoot(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;J)I
    .locals 6
    .parameter "ctx"
    .parameter "script"
    .parameter "res"
    .parameter "timeout"

    .prologue
    .line 739
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-static/range {v0 .. v5}, Lmobi/qiss/firewall/Api;->runScript(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;JZ)I

    move-result v0

    return v0
.end method

.method public static saveRules(Landroid/content/Context;)V
    .locals 9
    .parameter "ctx"

    .prologue
    const/16 v8, 0x7c

    .line 368
    const-string v6, "DroidWallPrefs"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 369
    .local v5, prefs:Landroid/content/SharedPreferences;
    invoke-static {p0}, Lmobi/qiss/firewall/Api;->getApps(Landroid/content/Context;)[Lmobi/qiss/firewall/Api$DroidApp;

    move-result-object v0

    .line 371
    .local v0, apps:[Lmobi/qiss/firewall/Api$DroidApp;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 372
    .local v4, newuids_wifi:Ljava/lang/StringBuilder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 373
    .local v3, newuids_3g:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v6, v0

    if-ge v2, v6, :cond_4

    .line 374
    aget-object v6, v0, v2

    iget-boolean v6, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_wifi:Z

    if-eqz v6, :cond_1

    .line 375
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 376
    :cond_0
    aget-object v6, v0, v2

    iget v6, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 378
    :cond_1
    aget-object v6, v0, v2

    iget-boolean v6, v6, Lmobi/qiss/firewall/Api$DroidApp;->selected_3g:Z

    if-eqz v6, :cond_3

    .line 379
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 380
    :cond_2
    aget-object v6, v0, v2

    iget v6, v6, Lmobi/qiss/firewall/Api$DroidApp;->uid:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 373
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 384
    :cond_4
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 385
    .local v1, edit:Landroid/content/SharedPreferences$Editor;
    const-string v6, "AllowedUidsWifi"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 386
    const-string v6, "AllowedUids3G"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 387
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 388
    return-void
.end method

.method private static scriptHeader(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "ctx"

    .prologue
    .line 86
    const-string v2, "bin"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, dir:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/iptables_armv5"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, myiptables:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IPTABLES=iptables\nBUSYBOX=busybox\nGREP=grep\nECHO=echo\n# Try to find busybox\nif "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/busybox_g1 --help >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tBUSYBOX="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/busybox_g1\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tGREP=\"$BUSYBOX grep\"\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tECHO=\"$BUSYBOX echo\"\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "elif busybox --help >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tBUSYBOX=busybox\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "elif /system/xbin/busybox --help >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tBUSYBOX=/system/xbin/busybox\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "elif /system/bin/busybox --help >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tBUSYBOX=/system/bin/busybox\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "fi\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "# Try to find grep\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "if ! $ECHO 1 | $GREP -q 1 >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tif $ECHO 1 | $BUSYBOX grep -q 1 >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t\tGREP=\"$BUSYBOX grep\"\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tfi\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t# Grep is absolutely required\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tif ! $ECHO 1 | $GREP -q 1 >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t\t$ECHO The grep command is required. DroidWall will not work.\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t\texit 1\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tfi\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "fi\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "# Try to find iptables\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "if "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " --version >/dev/null 2>/dev/null ; then\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\tIPTABLES="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "fi\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static setEnabled(Landroid/content/Context;Z)V
    .locals 3
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 811
    if-nez p0, :cond_1

    .line 826
    :cond_0
    :goto_0
    return-void

    .line 812
    :cond_1
    const-string v0, "DroidWallPrefs"

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 813
    const-string v1, "Enabled"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eq v1, p1, :cond_0

    .line 816
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 817
    const-string v1, "Enabled"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 818
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_2

    .line 819
    const-string v0, "Error writing to preferences"

    invoke-static {p0, v0}, Lmobi/qiss/firewall/Api;->alert(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 823
    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.googlecode.droidwall.intent.action.STATUS_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 824
    const-string v1, "com.googlecode.droidwall.intent.extra.STATUS"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 825
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method
