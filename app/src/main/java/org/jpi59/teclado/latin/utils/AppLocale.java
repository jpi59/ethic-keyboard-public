/*
 * Copyright (C) 2026 jpi59
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package org.jpi59.teclado.latin.utils;

import android.content.Context;
import android.content.res.Configuration;
import android.preference.PreferenceManager;

import java.util.Locale;

/** Applies the optional display-language choice to the keyboard's own UI. */
public final class AppLocale {
    public static final String UI_LANGUAGE_KEY = "ui_language";
    private static final String SYSTEM_LANGUAGE = "system";

    private AppLocale() {}

    /** Returns a context with the user's selected display language, if any. */
    public static Context wrap(final Context base) {
        final String language = PreferenceManager.getDefaultSharedPreferences(base)
                .getString(UI_LANGUAGE_KEY, SYSTEM_LANGUAGE);
        if (!"en".equals(language) && !"es".equals(language)) {
            return base;
        }
        final Configuration configuration = new Configuration(base.getResources().getConfiguration());
        configuration.setLocale(Locale.forLanguageTag(language));
        return base.createConfigurationContext(configuration);
    }

    /** Stores a choice made in Settings. System keeps Android's existing language behavior. */
    public static void setLanguage(final Context context, final String language) {
        PreferenceManager.getDefaultSharedPreferences(context).edit()
                .putString(UI_LANGUAGE_KEY, language).apply();
    }
}
