import {Request, Response} from 'express';
import {string, object, array} from 'joi';

function validateCreateTheme(req: Request, res: Response, next: () => void) {
	const {error} = object({
		id: string().allow(null),
		name: string(),
		fontFamily: string().allow(null),
		colors: object({
			primary: string().allow(null),
			onPrimary: string().allow(null),
			primaryContainer: string().allow(null),
			onPrimaryContainer: string().allow(null),
			secondary: string().allow(null),
			onSecondary: string().allow(null),
			secondaryContainer: string().allow(null),
			onSecondaryContainer: string().allow(null),
			tertiary: string().allow(null),
			onTertiary: string().allow(null),
			tertiaryContainer: string().allow(null),
			error: string().allow(null),
			onError: string().allow(null),
			errorContainer: string().allow(null),
			onErrorContainer: string().allow(null),
			outline: string().allow(null),
			outlineVariant: string().allow(null),
			background: string().allow(null),
			onBackground: string().allow(null),
			surface: string().allow(null),
			onSurface: string().allow(null),
			surfaceVariant: string().allow(null),
			onSurfaceVariant: string().allow(null),
			inverseSurface: string().allow(null),
			shadow: string().allow(null),
			scrim: string().allow(null),
			surfaceTint: string().allow(null),
			gradientTabColor: array().items(string()).allow(null),
		},),
		images: object({
			onboarding: string().allow(null),
			applicationLogo: string().allow(null),
			notificationLogo: string().allow(null),
			adaptiveIconBackground: string().allow(null),
			adaptiveIconForeground: string().allow(null),
			androidLauncherIcon: string().allow(null),
			iosLauncherIcon: string().allow(null),
			webLauncherIcon: string().allow(null),
		},)
	}).validate(req.body);

	if (error) {
		return res.status(400).send(error.details[0].message);
	}
	next();
	return;
}

export {validateCreateTheme};
