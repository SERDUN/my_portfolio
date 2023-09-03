import 'reflect-metadata';

import {Router, Response} from 'express'
import {injectable} from 'inversify';

import {IControllerRoute} from './route.interface';


@injectable()
export abstract class BaseController {
	private readonly _router: Router;

	// @ts-ignore
	public constructor() {
		this._router = Router();
	}

	get router() {
		return this._router;
	}

	public created(res: Response) {
		return res.sendStatus(201);
	}

	public send<T>(res: Response, code: number, message: T) {
		res.type('application/json');
		return res.status(code).json(message)
	}

	public ok<T>(res: Response, message: T) {
		return this.send<T>(res, 200, message);
	}

	public noContent(res: Response) {
		return this.send(res, 204, 'No content');
	}

	protected bindRoute(routes: IControllerRoute[]) {
		for (const route of routes) {
			const middleware = route.middlewares?.map((m) => m.execute.bind(m))
			const handler = route.func.bind(this);
			const pipeline = middleware ? [...middleware, handler] : handler
			this.router[route.method](route.path, pipeline);
		}
	}
}
