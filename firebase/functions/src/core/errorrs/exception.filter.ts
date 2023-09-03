import 'reflect-metadata';

import {Request, Response, NextFunction} from 'express';
import {injectable} from 'inversify';

import IExceptionFilter from './exception.filter.interface';
import HTTPError from './http_error.class';

@injectable()
export default class ExceptionFilter implements IExceptionFilter {
	catch(err: Error | HTTPError, req: Request, res: Response, next: NextFunction) {
		if (err instanceof HTTPError) {
			res.status(err.statusCode).send({err: err.message});
		} else {
			res.status(500).send({err: err.message});
		}
	}
}
