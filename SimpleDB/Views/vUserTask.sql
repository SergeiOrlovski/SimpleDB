CREATE VIEW [dbo].[vUserTask]
	AS SELECT u.[Name]  AS UserName,
			  t.[TaskName],
			  t.[DeadLine] AS DEADLINE
	FROM [Users] u INNER JOIN UserTask ut ON ut.UserId= u.Id LEFT JOIN Tasks t ON t.Id=ut.TaskId 