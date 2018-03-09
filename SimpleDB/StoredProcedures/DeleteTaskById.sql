CREATE PROCEDURE [dbo].[DeleteTaskById]
	@TaskId int
AS
	DELETE Tasks WHERE Tasks.Id = @TaskId
GO
